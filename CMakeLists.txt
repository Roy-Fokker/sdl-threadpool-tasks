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

# Thread Pool Library
CPMAddPackage("gh:bshoshany/thread-pool@5.0.0") 
## Configure Thread Pool Library
set(BS_thread_pool_SRC_DIR ${${CPM_LAST_PACKAGE_NAME}_SOURCE_DIR})
add_library(BS_thread_pool STATIC)
target_include_directories(BS_thread_pool 
	PRIVATE
		${BS_thread_pool_SRC_DIR}/include)
target_sources(BS_thread_pool
	PUBLIC 
	FILE_SET lib_modules TYPE CXX_MODULES 
	FILES 
		${BS_thread_pool_SRC_DIR}/modules/BS.thread_pool.cppm)
target_compile_features(BS_thread_pool PRIVATE cxx_std_23)
target_compile_definitions(BS_thread_pool
	PRIVATE
		BS_THREAD_POOL_IMPORT_STD)
add_library(BS::thread_pool ALIAS BS_thread_pool)

# project and language to be used
project(threadpool-tasks
	LANGUAGES CXX
	HOMEPAGE_URL "https://roy-fokker.github.io/threadpool-tasks/"
	DESCRIPTION "Learning how to setup and use a threadpool.")

# executable source folder
add_subdirectory(src)
