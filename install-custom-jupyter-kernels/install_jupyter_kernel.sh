#!/usr/bin/env bash

#==============================================================================
#title           :install_jupyter_kernel.sh
#description     :Installs a python virtual environment as a custom jupyter kernel.  Tested with the UA HPC.
#author		     :Gus Hahn-powell
#date            :2019
#usage		     :bash install_jupyter_kernel.sh "hahnpowell" "venv-demo" "Custom Python environment"
#notes           :Requires virualenv to be available on path.  On UA HPC, this can be ensured by running `module load python/3.5` (see below).  Assumes virtual environment is installed under /extra/NETID/venvs/
#==============================================================================

if [[ $# -ne 3 ]]; then
    echo "Illegal number of parameters!"
    echo "usage:"
    echo -e "\tbash install_venv.sh 'netid' 'venv-name-here' 'venv description here'"
    exit 2
fi

NETID=$1
VENV_NAME=$2
VENV_DESCRIPTION=$3

echo "NETID: $NETID"
echo "VENV_NAME: $VENV_NAME"
echo "VENV_DESCRIPTION: $VENV_DESCRIPTION"

# 1. activate our environment
source /extra/$NETID/venvs/$VENV_NAME/bin/activate

# 2. install ipykernel
pip install ipykernel

# 3. install a custom jupyter kernel
python -m ipykernel install --user --name "$VENV_NAME" --display-name "$VENV_DESCRIPTION"

# inspect the config associated with this kernel
echo "kernel config location: ~/.local/share/jupyter/kernels/$VENV_NAME/kernel.json"
echo "kernel config: "
cat ~/.local/share/jupyter/kernels/$VENV_NAME/kernel.json
