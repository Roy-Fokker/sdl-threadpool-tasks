# Solution is experimental in CMake 3.30 - 4.0
cmake_minimum_required(VERSION 4.0 FATAL_ERROR)

# Set the experimental flag
# Get values by version from
# 	https://github.com/Kitware/CMake/blob/master/Help/dev/experimental.rst#c-import-std-support
set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD
#	"0e5b6991-d74f-4b3d-a41c-cf096e0b2508" # value as per https://www.kitware.com/import-std-in-cmake-3-30/
#	"a9e1cf81-9932-4810-974b-6eccaf14e457" # updated value for 4.0.0
	"d0edc3af-4c50-42ea-a356-e2862fe7a444" # 4.0.3
)

# tell CMake we want to use 'import std' 
# will get enabled for all targets declared after this
set(CMAKE_CXX_MODULE_STD 1)
