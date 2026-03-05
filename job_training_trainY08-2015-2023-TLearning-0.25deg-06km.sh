#!/bin/bash

#SBATCH -J trainY01-2018-2018-T1
#SBATCH -o training.trainY01-2018-2018-TLearning-0.25deg.%j.out
#SBATCH -e training.trainY01-2018-2018-TLearning-0.25deg.%j.out
#SBATCH --nodes=4
#SBATCH --tasks-per-node=4
#SBATCH --gpus-per-node=4
#SBATCH --cpus-per-task=16
#SBATCH --qos=debug
#SBATCH --account=m4718
#SBATCH --constraint=gpu&hbm80g
#SBATCH -t 00:30:00

# salloc --nodes 4 --qos interactive --time 00:30:00 --constraint gpu --account m4718
# srun --jobid $SLURM_JOB_ID --tasks-per-node=4 --gpus-per-node=4 --cpus-per-task=16 /global/u1/b/bhuang95/sorc/fromTim/anemoi/V20250603/anemoi-house/slurm2ddp.sh anemoi-training train --config-name=config

module load conda
conda activate anemoi
export MPLBACKEND=Agg

srun --jobid $SLURM_JOB_ID /global/u1/b/bhuang95/sorc/fromTim/anemoi/V20250603/anemoi-house//slurm2ddp.sh anemoi-training train --config-name=config_trainY08-2015-2023-TLearning-0.25deg-06km
