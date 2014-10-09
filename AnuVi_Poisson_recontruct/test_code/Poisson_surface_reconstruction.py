#This example demostrates the 'Poisson surface reconstruction' visualization pipeline. 


from vtk import *
import os
from Anuvi import *


#Load the source
ANUVI_DATA_ROOT=os.getenv('ANUVI_DATA_ROOT')


data_source = vtkPLYReader()
data_source.SetFileName(ANUVI_DATA_ROOT + "Data/PLY/cpss.ply")

#Filter the data using Poisson surface reconstruction algorithm(outputs tetrahedral mesh)
poisson=AnuviPoisson3DFilter()
poisson.Setfacetangle(20.0)
poisson.Setfacetsize(1.0)
poisson.Setfacetdistance(0.375)
poisson.SetInputConnection(data_source.GetOutputPort()) 

#Use geometry filter to extract geometry(cells & faces are extracted) from the output of Poisson filter
geometryFilter = vtkGeometryFilter()
geometryFilter.ExtentClippingOff()
#geometryFilter.SetExtent(-1.0,1.0,-1.0,1.0,-1.0,1.0)
geometryFilter.SetInputConnection(poisson.GetOutputPort())

#Map the data to vtkDataSetMapper(WHY CAN'T WE DIRECTLY USE THE OUTPUT OF FILTER AS AN INPUT TO THE vtkactor???)
surface_data_mapper = vtkPolyDataMapper()
surface_data_mapper.SetInputConnection(geometryFilter.GetOutputPort())

#Create the vtkactor and assign vtkmapper created earlier to it.
#Set properties of vtkactor(OPTIONAL)
surface_actor = vtkLODActor()
surface_actor.SetMapper(surface_data_mapper)

#Create a renderer(the default vtkrenderer from AnuviContainer()) and assign the vtkactor to it.

try:
  ren = AnuviViewer.GetRenderer()
except:
  AnuviViewer = AnuviContainer()
  ren = vtkRenderer()
  AnuviViewer.GetVTKWindow().GetRenderWindow().AddRenderer(ren)
  AnuviViewer.GetVTKWindow().SetKeyInteraction(True)


#Add actor to renderer + set some properties for renderer(OPTIONAL)
ren.AddActor( surface_actor )
ren.SetBackground( 0.1, 0.2, 0.4 )
cam = ren.GetActiveCamera()
cam.SetPosition(0.0 , 0.0, 10.0)

#Take handle of renderer window & RENDER!!
renwin = AnuviViewer.GetVTKWindow()
ren.ResetCamera() #putting camera to the center of data
renwin.Render()

