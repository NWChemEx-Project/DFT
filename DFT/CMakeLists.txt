

set(DFT_SRCS dft.cpp
             nwpw/nwpw.cpp
)

set(DFT_INCLUDES dft.hpp
              nwpw/nwpw.hpp
)

cpp_add_library(
    dft
    SOURCES ${DFT_SRCS}
    INCLUDES ${DFT_INCLUDES}
    DEPENDS libmathematician::mathematician integrals::integrals
)

cpp_install(TARGETS dft)


