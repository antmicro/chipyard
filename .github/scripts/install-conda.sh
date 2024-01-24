#!/bin/bash

export HOME="${HOME:-/root}"

set -ex
set -o pipefail

curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh -b -p "${HOME}/conda"

source "${HOME}/conda/etc/profile.d/conda.sh"
source "${HOME}/conda/etc/profile.d/mamba.sh"

conda install -n base conda-libmamba-solver
conda config --set solver libmamba
conda install -n base conda-lock==1.4.0
conda activate base

# PATH_STR="export PATH=/opt/conda/bin/:\$PATH\""
# echo $PATH_STR >> ~/.bashrc

