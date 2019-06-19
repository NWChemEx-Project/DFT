cmake_minimum_required(VERSION 3.13)
project(dft VERSION 1.0.0)
find_package(cpp REQUIRED)
cpp_option(BUILD_TESTS ON)

cpp_find_or_build_dependency(
        NAME integrals
        URL github.com/NWChemEx-Project/Integrals
        PRIVATE
        CMAKE_ARGS BUILD_TESTS=OFF
)

cpp_find_or_build_dependency(
        NAME libmathematician
        URL github.com/NWChemEx-Project/LibMathematician
        PRIVATE
        CMAKE_ARGS BUILD_TESTS=OFF
)

add_subdirectory(dft)

### Testing ###
if(BUILD_TESTS)
    cpp_find_or_build_dependency(NAME Catch2 URL github.com/catchorg/Catch2)
    enable_testing()
    add_subdirectory(tests)
endif()
