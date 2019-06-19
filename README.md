# DFT
Common DFT bits
This is meant to be a common repository to integrate Gaussian and PW DFT codes

export NWX_INSTALL=/Users/bylaska/Codes/NWChemEX-Development/June-19-2019/install

cmake .. -DCMAKE_C_COMPILER=gcc-9 -DCMAKE_CXX_COMPILER=g++-9 -DCMAKE_Fortran_COMPILER=gfortran -DCMAKE_INSTALL_PREFIX=$NWX_INSTALL -DCMAKE_PREFIX_PATH=$NWX_INSTALL -DCPP_GITHUB_TOKEN=
