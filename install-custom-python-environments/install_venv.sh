#!/usr/bin/env bash

#==============================================================================
#title           :install_venv.sh
#description     :Installs a python virtual environment.  Tested with the UA HPC.
#author		     :Gus Hahn-powell
#date            :2019
#usage		     :bash install_venv.sh "hahnpowell" "venv-demo"
#notes           :Requires virualenv to be available on path.  On UA HPC, this can be ensured by running `module load python/3.5` (see below).  Virtual environment will be installed under /extra/NETID/venvs/
#==============================================================================

if [[ $# -ne 2 ]]; then
    echo "Illegal number of parameters!"
    echo "usage:"
    echo -e "\tbash install_venv.sh 'netid' 'venv-name-here'"
    exit 2
fi

NETID=$1
VENV_NAME=$2

echo "NETID: $NETID"
echo "VENV_NAME: $VENV_NAME"

# python -> python v3.5
# NOTE: necessary to locate the virtualenv command
# used in Step 1
module load python/3.5

# for organizational purposes,
# all virtual environments live here
# as of this writing,
# all HPC account holders recieve 200GB of space under /extra/netid
# see https://public.confluence.arizona.edu/display/UAHPC/Allocation+and+Limits
# because environments can become quite large 
# and space in our home directory is limited, 
# we'll create our environments under /extra
VENVS_LOC=/extra/$NETID/venvs

# ensure the directory exists
mkdir -p $VENVS_LOC

echo "Installing '$VENV_NAME' under $VENVS_LOC"

# 1. create the environment
virtualenv --python=python3.6 --system-site-packages $VENVS_LOC/$VENV_NAME

# 2. activate our environment
source $VENVS_LOC/$VENV_NAME/bin/activate

# verify the env is active
echo "python: `which python`"

# verify pip points to your env's pip
echo "pip: `which pip`"

# 5. install whatever packages 
# you'd like to use with this environment
pip -r requirements.txt

echo "Installation complete!"
echo "For ease of use, consider adding the following line to your ~/.bash_profile:"

echo "alias $VENV_NAME='source $VENVS_LOC/$VENV_NAME/bin/activate'"
