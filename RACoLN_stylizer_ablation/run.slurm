#!/bin/bash -l

##############################
#       Job blueprint        #
##############################

# Give your job a name, so you can recognize it in the queue overview
#SBATCH --job-name=racoln_stylizer

# Remove one # to uncommment
#SBATCH --output=racoln_no_stylizer.out

# Define, how many nodes you need. Here, we ask for 1 node.
#SBATCH -N 1 #nodes
#SBATCH -n 1 #tasks
#SBATCH --cpus-per-task=6
#SBATCH --mem=88G
#SBATCH --time=0-11:39:00    # Run for 6 hours
#SBATCH --gres=gpu:rtx_2080:1

# Turn on mail notification. There are many possible self-explaining values:
# NONE, BEGIN, END, FAIL, ALL (including all aforementioned)
# For more values, check "man sbatch"
#SBATCH --mail-type=ALL
# Remember to set your email address here instead of nobody
#SBATCH --mail-user=saml@princeton.edu

# Run This
source ~/.bashrc
conda activate racoln
python train_tsf_model.py

# Finish the script
exit 0
