#include "AnuviPoisson3DFilter.h"
#include <map>
#include <CGAL/Cgal_Utility.h>

#include "vtkInformation.h"
#include "vtkInformationVector.h"
#include "vtkObjectFactory.h"
#include "vtkStreamingDemandDrivenPipeline.h"
#include "vtkPolyData.h"
#include "vtkFloatArray.h"
#include "vtkCellArray.h"
#include "vtkUnstructuredGrid.h"


vtkCxxRevisionMacro(AnuviPoisson3DFilter, "$Revision: 1.4 $");
vtkStandardNewMacro(AnuviPoisson3DFilter);  //NOT CLEAR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



AnuviPoisson3DFilter::AnuviPoisson3DFilter()
{
  this->facetangle = 0.0;
  this->facetsize = 0.0;
  this->facetdistance = 0.0;
 // this->numofneighbors=0; //used for normal estimation to define number of nearest neighbours on which to fit a plane for computing the normal.
  this->SetNumberOfInputPorts(1);
}

AnuviPoisson3DFilter::~AnuviPoisson3DFilter()
{
}

int AnuviPoisson3DFilter::RequestData(
  vtkInformation *vtkNotUsed(request),
  vtkInformationVector **inputVector,
  vtkInformationVector *outputVector)
{
printf("\nPoisson starts...\n");
fflush(stdout);
printf("Facet angle:%f\nFacet size:%f\nFacet distance:%f\n",this->facetangle,this->facetsize,this->facetdistance);
    //Read data from 'inputvector'. It is expected to be (X,Y,Z) format.
    // get the info objects
    vtkInformation *inInfo = inputVector[0]->GetInformationObject(0);
    vtkInformation *outInfo = outputVector->GetInformationObject(0);

    // get the input and output
    vtkPolyData *input = vtkPolyData::SafeDownCast(
    inInfo->Get(vtkDataObject::DATA_OBJECT()));

    //Convert 'vtkPolyData' to array of 'Point' which can be processed by CGAL for normal estimation
     //1. Estimate normals using linear least square fitting of normals
     //2. Estimate orientation of normals

    std::list<PointVectorPair> points;

    //Total number of points
    int n_points=input->GetNumberOfPoints();
    double vtk_point[3];
    PointVectorPair point_normal_pair;
    //Copy the vtk points to array to be used by CGAL
    for(int i=0;i<n_points;i++)
    {
        input->GetPoint(i,vtk_point);

        point_normal_pair.first=Point(vtk_point[0],vtk_point[1],vtk_point[2]);
        point_normal_pair.second=Vector(NULL,NULL,NULL); //normal vector(initialized to NULL)

        points.push_back(point_normal_pair);
    }


    //Read the points from vtkPolyData to 'points'

printf("Starting Normal estimation...\n");
    //
    // Estimates normals direction.
    // Note: pca_estimate_normals() requires an iterator over points
    // as well as property maps to access each point's position and normal.
    const int nb_neighbors = 25; // K-nearest neighbors = 3 rings
    CGAL::pca_estimate_normals(points.begin(), points.end(),
                               CGAL::First_of_pair_property_map<PointVectorPair>(),
                               CGAL::Second_of_pair_property_map<PointVectorPair>(),
                               nb_neighbors);
    printf("Done. Starting normal orientation estimation...\n");
    // Orients normals.
    // Note: mst_orient_normals() requires an iterator over points
    // as well as property maps to access each point's position and normal.
    std::list<PointVectorPair>::iterator unoriented_points_begin =
        CGAL::mst_orient_normals(points.begin(), points.end(),
                                 CGAL::First_of_pair_property_map<PointVectorPair>(),
                                 CGAL::Second_of_pair_property_map<PointVectorPair>(),
                                 nb_neighbors);

    //delete points with an unoriented normal
    // if you plan to call a reconstruction algorithm that expects oriented normals.
    points.erase(unoriented_points_begin, points.end());

     printf("Done.Starting Implicit function computation...\n");


///Mesh generation starts here.
// Creates implicit function from the read points using the default solver.
// Note: this method requires an iterator over points
// + property maps to access each point's position and normal.
// The position property map can be omitted here as we use iterators over Point_3 elements.

    PointList points_vector;

    //Lets initialize the points_vector with Point+Normal information from 'points'
    while(!points.empty())
    {
         Point_with_normal point_normal_vector(points.front().first,points.front().second);
         points.pop_front();
         points_vector.push_back(point_normal_vector);
         //printf("No. of points:%d\n",points.size());
    }

    Poisson_reconstruction_function function(points_vector.begin(), points_vector.end(),
            CGAL::make_normal_of_point_with_normal_pmap(points_vector.begin()) );
// Computes the Poisson indicator function f()
// at each vertex of the triangulation.
    if ( ! function.compute_implicit_function() ) //Computes the scaler operator by applying delauney refinement+slving using sparse linear solver.
        return EXIT_FAILURE; // computed function is 0 at all input points and -ve within the inferred surface.

printf("Done. Computing average spacing...\n");
// Computes average spacing
    FT average_spacing = CGAL::compute_average_spacing(points_vector.begin(), points_vector.end(),
                         6 /* knn = 1 ring */); //Assuming isotropic sampling!!!!!
// Gets one point inside the implicit surface
// and computes implicit function bounding sphere radius.
    Point inner_point = function.get_inner_point();
    Sphere bsphere = function.bounding_sphere();
    FT radius = std::sqrt(bsphere.squared_radius());
// Defines the implicit surface: requires defining a
// conservative bounding sphere centered at inner point.
    FT sm_sphere_radius = 5.0 * radius;
    FT sm_dichotomy_error = this->facetdistance*average_spacing/1000.0; // Dichotomy error must be << sm_distance
    Surface_3 surface(function,
                      Sphere(inner_point,sm_sphere_radius*sm_sphere_radius),
                      sm_dichotomy_error/sm_sphere_radius);
// Defines surface mesh generation criteria
    CGAL::Surface_mesh_default_criteria_3<STr> criteria(this->facetangle, // Min triangle angle (degrees)
            this->facetsize*average_spacing, // Max triangle size
            this->facetdistance*average_spacing); // Approximation error

printf("Making Surface mesh...\n");
printf("No. of points:%lu\n",points_vector.size());
// Generates surface mesh with manifold option
    STr tr; // 3D Delaunay triangulation for surface mesh generation
    C2t3 c2t3(tr); // 2D complex in 3D Delaunay triangulation
    CGAL::make_surface_mesh(c2t3, // reconstructed mesh
                            surface, // implicit surface
                            criteria, // meshing criteria
                            CGAL::Manifold_with_boundary_tag()); // require manifold mesh
   printf("Done!!\n");
   fflush(stdout);


    if(tr.number_of_vertices() == 0)
        {
            printf("Failed!!");
            fflush(stdout);
            return EXIT_FAILURE;
        }

        else
        {
            printf("Number of vertices in the 3D triangulation:%lu",tr.number_of_vertices());
            fflush(stdout);
        }

///Reconstruction done. Write the output back to vtk datatype.

  typedef  C2t3::Triangulation Triangulation;
  typedef  Triangulation::Vertex_handle Vertex_handle;

  //const Triangulation& tr = c2t3.triangulation();

  vtkPoints* const vtk_points = vtkPoints::New();
  vtkCellArray* const vtk_cells = vtkCellArray::New();

  vtk_points->Allocate(c2t3.triangulation().number_of_vertices());
  vtk_cells->Allocate(c2t3.number_of_facets());

  std::map<Vertex_handle, vtkIdType> V;
  vtkIdType inum = 0;

  typedef Triangulation::Point Point;

  for(Triangulation::Finite_vertices_iterator
        vit = tr.finite_vertices_begin(),
        end = tr.finite_vertices_end();
      vit != end;
      ++vit)
  {

    const Point & p = vit->point();
    vtk_points->InsertNextPoint(CGAL::to_double(p.x()),
                                CGAL::to_double(p.y()),
                                CGAL::to_double(p.z()));
    V[vit] = inum++;
  }

  for(C2t3::Facet_iterator
        fit = c2t3.facets_begin(),
        end = c2t3.facets_end();
      fit != end; ++fit)
  {
    vtkIdType cell[3];
    int j=0;
    for (int i = 0; i < 4; ++i)
      if (i != fit->second) //if the index of facet in the cell does not match index of vertex in facet then insert the vertex.
        cell[j++] =  V[(*fit).first->vertex(i)];
    CGAL_assertion(j==3);
    vtk_cells->InsertNextCell(3, cell);
  }

  vtkUnstructuredGrid *output = vtkUnstructuredGrid::SafeDownCast(
  outInfo->Get(vtkDataObject::DATA_OBJECT()));



  output->SetPoints(vtk_points);
  vtk_points->Delete();

  output->SetCells(VTK_TRIANGLE,vtk_cells);


  return 1;

}


//Following function ensures that only data of type 'vtkPolyData' is given in the input port for Poisson filter.
int AnuviPoisson3DFilter::FillInputPortInformation(int port, vtkInformation* info)
{
   if(!this->Superclass::FillInputPortInformation(port, info))
    {
    return 0;
    }
  info->Set(vtkAlgorithm::INPUT_REQUIRED_DATA_TYPE(), "vtkPolyData");
  return 1;
}

