#!/bin/bash

#SBATCH -J trainY40-1979-2018-TLearning-1.00deg
#SBATCH -o training.trainY40-1979-2018-TLearning-1.00deg-Step-A.%j.out
#SBATCH -e training.trainY40-1979-2018-TLearning-1.00deg-Step-A.%j.out
#SBATCH --nodes=4
#SBATCH --tasks-per-node=4
#SBATCH --gpus-per-node=4
#SBATCH --cpus-per-task=16
#SBATCH --qos=regular
#SBATCH --account=m4718
#SBATCH --constraint=gpu&hbm80g
#SBATCH -t 48:00:00

# salloc --nodes 4 --qos interactive --time 00:30:00 --constraint gpu --account m4718
# srun --jobid $SLURM_JOB_ID --tasks-per-node=4 --gpus-per-node=4 --cpus-per-task=16 /global/u1/b/bhuang95/sorc/fromTim/anemoi/V20250603/anemoi-house/slurm2ddp.sh anemoi-training train --config-name=config

module load conda
conda activate anemoi
export MPLBACKEND=Agg

srun --jobid $SLURM_JOB_ID /global/u1/b/bhuang95/sorc/fromTim/anemoi/V20250603/anemoi-house//slurm2ddp.sh anemoi-training train --config-name=config_trainY40-1979-2018-TLearning-1.00deg-Step-A
