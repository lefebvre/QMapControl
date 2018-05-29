TRIBITS_SUBPACKAGE(QMapControl)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/src)
IF(TPL_GDAL_ENABLED)
SET(GDAL_SOURCE
src/QMapControl/ESRIShapefile.cpp
src/QMapControl/LayerESRIShapefile.cpp
)
ENDIF()
SET(SOURCE
${GDAL_SOURCE}
src/QMapControl/GPS_Position.cpp
src/QMapControl/Geometry.cpp
src/QMapControl/GeometryLineString.cpp
src/QMapControl/GeometryPoint.cpp
src/QMapControl/GeometryPointArrow.cpp
src/QMapControl/GeometryPointCircle.cpp
src/QMapControl/GeometryPointImage.cpp
src/QMapControl/GeometryPointImageScaled.cpp
src/QMapControl/GeometryPointShape.cpp
src/QMapControl/GeometryPointShapeScaled.cpp
src/QMapControl/GeometryPolygon.cpp
src/QMapControl/GeometryPolygonImage.cpp
src/QMapControl/GeometryWidget.cpp
src/QMapControl/ImageManager.cpp
src/QMapControl/Layer.cpp
src/QMapControl/LayerGeometry.cpp
src/QMapControl/LayerMapAdapter.cpp
src/QMapControl/MapAdapter.cpp
src/QMapControl/MapAdapterGoogle.cpp
src/QMapControl/MapAdapterOSM.cpp
src/QMapControl/MapAdapterTile.cpp
src/QMapControl/MapAdapterWMS.cpp
src/QMapControl/MapAdapterYahoo.cpp
src/QMapControl/NetworkManager.cpp
src/QMapControl/Projection.cpp
src/QMapControl/ProjectionEquirectangular.cpp
src/QMapControl/ProjectionSphericalMercator.cpp
src/QMapControl/QMapControl.cpp
src/QMapControl/QProgressIndicator.cpp
)

IF(TPL_ENABLE_GDAL)
SET(GDAL_MOC_HEADERS
src/QMapControl/ESRIShapefile.h
src/QMapControl/LayerESRIShapefile.h
)
ENDIF()
SET(MOC_HEADERS
${GDAL_MOC_HEADERS}
src/QMapControl/Geometry.h
src/QMapControl/GeometryLineString.h
src/QMapControl/GeometryPoint.h
src/QMapControl/GeometryPointShape.h
src/QMapControl/GeometryPointShapeScaled.h
src/QMapControl/GeometryPolygon.h
src/QMapControl/GeometryWidget.h
src/QMapControl/ImageManager.h
src/QMapControl/Layer.h
src/QMapControl/LayerGeometry.h
src/QMapControl/LayerMapAdapter.h
src/QMapControl/MapAdapter.h
src/QMapControl/MapAdapterGoogle.h
src/QMapControl/MapAdapterOSM.h
src/QMapControl/MapAdapterTile.h
src/QMapControl/MapAdapterYahoo.h
src/QMapControl/NetworkManager.h
src/QMapControl/QMapControl.h
src/QMapControl/QProgressIndicator.h
)

QT5_WRAP_CPP(MOC_RESULTS ${MOC_HEADERS})

SET(HEADERS
${MOC_HEADERS}
src/QMapControl/GPS_Position.h
src/QMapControl/GeometryPointArrow.h
src/QMapControl/GeometryPointCircle.h
src/QMapControl/GeometryPointImage.h
src/QMapControl/GeometryPointImageScaled.h
src/QMapControl/GeometryPolygonImage.h
src/QMapControl/MapAdapterWMS.h
src/QMapControl/Point.h
src/QMapControl/Projection.h
src/QMapControl/ProjectionEquirectangular.h
src/QMapControl/ProjectionSphericalMercator.h
src/QMapControl/QuadTreeContainer.h
src/QMapControl/qmapcontrol_global.h
)

#
# Add library
TRIBITS_ADD_LIBRARY(QMapControl
  SOURCES ${SOURCE} ${MOC_RESULTS}
  NOINSTALLHEADERS ${HEADERS}
)

#
# Add test directory
TRIBITS_ADD_EXAMPLE_DIRECTORIES(Samples)

INSTALL(FILES ${HEADERS} DESTINATION "include/QMapControl/")
TRIBITS_SUBPACKAGE_POSTPROCESS()
