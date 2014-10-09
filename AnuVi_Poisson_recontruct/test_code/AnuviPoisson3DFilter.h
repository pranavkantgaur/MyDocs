

#ifndef __AnuviPoisson3DFilter_h
#define __AnuviPoisson3DFilter_h

#include "AnuviConfig.h"

#define CGAL_EIGEN3_ENABLED
#include <CGAL/trace.h>
#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>
#include <CGAL/Polyhedron_3.h>
#include <CGAL/IO/Polyhedron_iostream.h>
#include <CGAL/Surface_mesh_default_triangulation_3.h>
#include <CGAL/make_surface_mesh.h>
#include <CGAL/Implicit_surface_3.h>
//#include <CGAL/IO/output_surface_facets_to_polyhedron.h>
#include <CGAL/Poisson_reconstruction_function.h>
#include <CGAL/Point_with_normal_3.h>
#include <CGAL/property_map.h>
//#include <CGAL/IO/read_xyz_points.h>
#include <CGAL/compute_average_spacing.h>
#include <CGAL/pca_estimate_normals.h>
#include <CGAL/mst_orient_normals.h>

#include <utility>
#include <list>
#include <vector>
#include <fstream>
#include "vtkUnstructuredGridAlgorithm.h"


// Types
typedef CGAL::Exact_predicates_inexact_constructions_kernel Kernel;
typedef Kernel::FT FT;
typedef Kernel::Point_3 Point;
typedef Kernel::Vector_3 Vector;
typedef std::pair<Point, Vector> PointVectorPair;
typedef Kernel::Sphere_3 Sphere;
//typedef CGAL::Polyhedron_3<Kernel> Polyhedron;
typedef CGAL::Poisson_reconstruction_function<Kernel> Poisson_reconstruction_function;
typedef CGAL::Surface_mesh_default_triangulation_3 STr;
typedef CGAL::Surface_mesh_complex_2_in_triangulation_3<STr> C2t3;
typedef CGAL::Implicit_surface_3<Kernel, Poisson_reconstruction_function> Surface_3;

typedef Kernel::Point_3 Point;
typedef CGAL::Point_with_normal_3<Kernel> Point_with_normal;

typedef std::vector<Point_with_normal> PointList;


class ANUVI_FILTERING_EXPORT AnuviPoisson3DFilter : public vtkUnstructuredGridAlgorithm
{
public:
//  vtkTypeRevisionMacro(AnuviDelaunay3DFilter,vtkPolyDataAlgorithm);
  vtkTypeRevisionMacro(AnuviPoisson3DFilter,vtkUnstructuredGridAlgorithm);
//  void PrintSelf(ostream& os, vtkIndent indent);

  // Description:
  static AnuviPoisson3DFilter *New();

  // Description:
  // Get/Set lower bound for angle of surface facet. This parameter controls the shape of surface facets.
  // The termination of the meshing process is guranteed if the angular bound is at most 30 degrees.

  vtkSetMacro(facetangle, double);
  vtkGetMacro(facetangle, double);

  // Description:
  // Get/Set  bound for the size (edge length) of surface facets. Each surface facet has a surface Delaunay
  // ball which is a ball circumscribing the surface facet and centered on the surface patch. The radius
  // bound is an upper bound on the radii of the surface Delaunay balls.
  vtkSetMacro(facetsize, double);
  vtkGetMacro(facetsize, double);

  // Description:
  // Get/Set facetdistance. This parameter controls the approximation error of the surface. Actually, it is an
  // upper bound for the distance between the circumcenter of the surface facet and the center of a surface
  // Delaunay ball of this facet.
  vtkSetMacro(facetdistance, double);
  vtkGetMacro(facetdistance, double);

 // vtkSetClampMacro(numofneighbors,int,0,);
  //vtkGetClampMacro(numofneighbors,int);
protected:
  AnuviPoisson3DFilter();
  ~AnuviPoisson3DFilter();

  int FillInputPortInformation(int, vtkInformation*);

  int RequestData(vtkInformation *, vtkInformationVector **, vtkInformationVector *);
 // int RequestInformation(vtkInformation *, vtkInformationVector **, vtkInformationVector *);
 // int RequestUpdateExtent(vtkInformation *, vtkInformationVector **, vtkInformationVector *);

  double facetangle;
  double facetsize;
  double facetdistance;
  //int numofneighbors;//used for normal estimation
private:
  AnuviPoisson3DFilter(const AnuviPoisson3DFilter&);  // Not implemented.
  void operator=(const AnuviPoisson3DFilter&);  // Not implemented.
};

#endif

