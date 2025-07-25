# get platform specific configs
if(MSVC)
	include(${CMAKE_MODULE_PATH}/Win32Presets.cmake)
elseif(LINUX)
	include(${CMAKE_MODULE_PATH}/LinuxPresets.cmake)
endif()

# name of this application/library
set(PRJ_APP_NAME "app")

# create executable for initial setup
add_executable(${PRJ_APP_NAME})

# ensure it's Standard C++ 23
target_compile_features(${PRJ_APP_NAME} PRIVATE cxx_std_23)

# set preprocessor defines
target_compile_definitions(${PRJ_APP_NAME}
	PRIVATE 
		UNICODE _UNICODE            # Tell compiler we are using UNICODE
		${platform_definitions}     # Get platform specific definitions
)

# precompiled headers
target_precompile_headers(${PRJ_APP_NAME}
	PRIVATE
		pch.hpp
)

# source files for this application
target_sources(${PRJ_APP_NAME}
	# Non C++ module source files
	PRIVATE
		main.cpp

	# magic encantations for C++ Modules Support in CMake
	PRIVATE FILE_SET app_modules TYPE CXX_MODULES FILES
		
)

# libraries used by this application
target_link_libraries(${PRJ_APP_NAME}
	PRIVATE
		BS::thread_pool
)
