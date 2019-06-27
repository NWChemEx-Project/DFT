#!/bin/bash

export NWX_SETUP=`pwd`/June-19-2019

args=("$@")
nargs=("$#")

if [ -z $1 ]; then
        echo "----------------------------"
        echo "ERROR: No arguments provided"
        echo "----------------------------"
        echo "Script usage: ./nwx_build.bash /path/to/toolchain_file [#cores]"
        exit 1
fi

export NWX_SRC=$NWX_SETUP/repos
export NWX_BLD=$NWX_SETUP/builds
export NWX_INSTALL=$NWX_SETUP/install

if [ -d "$NWX_SETUP" ]; then
    echo "$NWX_SETUP already exists. Please rename/remove it before proceeding."
    exit 1
fi

mkdir -p $NWX_SRC $NWX_BLD $NWX_INSTALL

ncores=2
if [[ $nargs == 2 ]]; then
 ncores=${args[1]}
fi

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

echo "Using $ncores cores for building..."
tcf=`realpath ${args[0]}`
echo "Toolchain file provided: $tcf"

function build_nwx {
    repo_org="NWChemEx-Project"
    if [[ "$1" == "CMakePackagingProject" ]]; then
        repo_org=$1
    fi
  git clone git@github.com:$repo_org/$1 $NWX_SRC/$1    
  cmake -H$NWX_SRC/$1 -B$NWX_BLD/build_$1 \
    -DCMAKE_TOOLCHAIN_FILE=$tcf \
    -DCMAKE_PREFIX_PATH=$NWX_INSTALL \
	-DCMAKE_INSTALL_PREFIX=$NWX_INSTALL \
	-DCMAKE_BUILD_TYPE=Release -DARMCI_NETWORK="MPI-TS"
  make -j $ncores -C $NWX_BLD/build_$1 install
}

build_nwx CMakeBuild && \
build_nwx CMakePackagingProject && \
build_nwx TAMM && \
build_nwx SDE && \
build_nwx Utilities && \
build_nwx LibChemist && \
build_nwx PropertyTypes && \
build_nwx Integrals && \
build_nwx LibMathematician && \
#build_nwx SCF && \
build_nwx DFT
