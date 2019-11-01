## Install python virtual environment

```bash
# python -> python v3.5
module load python/3.5

VENV_NAME="venv-demo"

NETID="hahnpowell"

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
mkdir $VENVS_LOC

# 1. create the environment
virtualenv --python=python3.6 --system-site-packages $VENVS_LOC/$VENV_NAME

# 2. activate our environment
source $VENVS_LOC/$VENV_NAME/bin/activate

# verify the env is active
which python

# verify pip points to your env's pip
which pip

# 3. install ipykernel
pip install ipykernel ipython

# 4. install whatever packages 
# you'd like to use with this environment
# pip install <your package here>
```

## Install custom jupyter kernel

```bash
VENV_DESCRIPTION="An example virtual environment"

# 1. activate our environment (if not already active)
source $VENVS_LOC/$VENV_NAME/bin/activate

#jupyter kernelspec install --user $DEST/venv/$VENV --name "$VENV"

# 2. install a custom jupyter kernel
python -m ipykernel install --user --name "$VENV_NAME" --display-name "$VENV_DESCRIPTION"

# inspect the config associated with this kernel
# less ~/.local/share/jupyter/kernels/$VENV_NAME/kernel.json
```

## Remove a custom kernel

```bash
rm -rf ~/.local/share/jupyter/kernels/$VENV_NAME
```
