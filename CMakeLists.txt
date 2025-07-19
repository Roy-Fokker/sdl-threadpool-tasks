cmake_minimum_required(VERSION 4.0)

# Enable scan for dependencies
set(CMAKE_CXX_SCAN_FOR_MODULES ON)
# disable C++ extensions
set(CMAKE_CXX_EXTENSIONS OFF)
# force C++ version to 23
set(CMAKE_CXX_STANDARD 23)
# standard is required
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Include Std Modules cmake 
# must be included BEFORE project() call
include(${CMAKE_MODULE_PATH}/import-std.cmake)

# Dependencies
include(${CMAKE_MODULE_PATH}/CPM.cmake)

# project and language to be used
project(threadpool-tasks
	LANGUAGES CXX
	HOMEPAGE_URL "https://roy-fokker.github.io/threadpool-tasks/"
	DESCRIPTION "Learning how to setup and use a threadpool.")

# executable source folder
add_subdirectory(src)
