```bash
qsub -I \
-N install-venv \
-W group_list=ua-hlt \
-q standard \
-l select=1:ncpus=1:mem=6gb \
-l walltime=1:0:0
```
