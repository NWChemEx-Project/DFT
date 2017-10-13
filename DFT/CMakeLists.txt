cmake_minimum_required(VERSION 3.1)
project(DFT-SRC VERSION 0.0.0 LANGUAGES CXX Fortran C)
include(TargetMacros)
set(DFT_SRCS )
set(DFT_INCLUDES )
set(DFT_DEFINITIONS )
nwchemex_add_library(DFT DFT_SRCS
                                 DFT_INCLUDES
                                 DFT_DEFINTIONS
)
