#!/bin/bash
#SBATCH --job-name=""
#SBATCH --output="/home/arno/nemar/unittestresults/logs/_%j.%N.out"
#SBATCH --partition=shared
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=4Gb
#SBATCH --export=ALL
#SBATCH -t 10:00:00
#SBATCH --mail-user=adelorme@ucsd.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH -A csd403
source ~/.bashrc
cd /home/arno/nemar/eeglab-testcases/unittesting_
module load matlab
matlab -nodisplay -nosplash -nodesktop < /home/arno/nemar/eeglab-testcases/runtest.m
