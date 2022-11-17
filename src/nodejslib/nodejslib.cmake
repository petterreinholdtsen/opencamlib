message(STATUS "Will build node.js library")

if(CMAKE_BUILD_TYPE MATCHES "Debug")
	message(STATUS "Debug build, passing -g flag to compiler to emit source location (handy for debugging with lldb)")
	add_definitions(-g)
endif()

include_directories(${OpenCamLib_SOURCE_DIR}/nodejslib/node_modules/node-addon-api)
include_directories(${CMAKE_JS_INC})

# include dirs
include_directories( ${OpenCamLib_SOURCE_DIR}/cutters )
include_directories( ${OpenCamLib_SOURCE_DIR}/geo )
include_directories( ${OpenCamLib_SOURCE_DIR}/algo )
include_directories( ${OpenCamLib_SOURCE_DIR}/dropcutter )
include_directories( ${OpenCamLib_SOURCE_DIR}/common )
include_directories( ${OpenCamLib_SOURCE_DIR} )

include_directories(${OpenCamLib_SOURCE_DIR}/nodejslib)

add_library(ocl
	SHARED
	${OCL_GEO_SRC}
	${OCL_CUTTER_SRC}
	${OCL_DROPCUTTER_SRC}
	${OCL_ALGO_SRC}
	${OCL_COMMON_SRC}
	${OpenCamLib_SOURCE_DIR}/nodejslib/point_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/triangle_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/bbox_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/cylcutter_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/line_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/path_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/stlsurf_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/stlreader_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/waterline_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/pathdropcutter_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/adaptivepathdropcutter_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/adaptivewaterline_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/cylcutter_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/ballcutter_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/bullcutter_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/conecutter_js.cpp
	${OpenCamLib_SOURCE_DIR}/nodejslib/nodejslib.cpp
)

target_link_libraries(
  ocl
  ${Boost_LIBRARIES}
  ${OpenMP_CXX_LIBRARIES}
  ${CMAKE_JS_LIB}
)

set(NODE_LIB_POSTFIX ".node")
set_target_properties(ocl PROPERTIES PREFIX "" SUFFIX ${NODE_LIB_POSTFIX})

add_definitions(-DNAPI_VERSION=3)
