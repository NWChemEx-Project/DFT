set(DFT_TESTS test_dft.cpp

)

cpp_add_executable(
    test_dft
    SOURCES ${DFT_TESTS}
    DEPENDS dft Catch2::Catch2
)

add_test(NAME test_dft COMMAND test_dft)
