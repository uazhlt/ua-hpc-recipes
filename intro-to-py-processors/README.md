### Input

```bash
ENV_LOC="/extra/hahnpowell/conda-environments/ua-hlt"
DESC="My example conda environment"
conda create -y --prefix $ENV_LOC python=3.7
source activate $ENV_LOC
conda install -y ipykernel
python -m ipykernel install --user --name ua-hlt --display-name "$DESC"
```

### Output

```bash
Installed kernelspec ua-hlt in /home/u21/hahnpowell/.local/share/jupyter/kernels/ua-hlt
```

### `py-processors` demo

```bash
module load anaconda/2019/2019.07
module load java/8
source activate /extra/hahnpowell/conda-environments/ua-hlt
pip install "py-processors[jupyter]"
```
