#!/bin/bash -l

#SBATCH --job-name="transfer_rate_bound_linf"  # Job name
#SBATCH --output=results_%j.log      # Output log file (%j will be replaced with the job ID)
#SBATCH -p gpu                  # Partition to use (adjust as per Iris settings)
#SBATCH -N 1                         # Number of nodes
#SBATCH --ntasks-per-node=1          # Number of tasks per node
#SBATCH --gres=gpu:1            # Number of CPUs per task (adjust based on resource needs)
#SBATCH --time=4:00:00               # Time limit (6 hours)
#SBATCH --mail-type=END,FAIL         # Notifications for job completion or failure
#SBATCH --mail-user=kejsi.bushi.001@student.uni.lu   # Replace with your email

# Load necessary modules
 module load lang/Python/3.8.6-GCCcore-10.2.0  # Load Python module (adjust version if needed)

# Navigate to the directory where the repository is cloned
cd /home/users/kbushi/AI-Cybersecurity       # Replace with the actual path to your cloned repository

# Activate virtual environment if needed
source /home/users/kbushi/AI-Cybersecurity/secondvenv         # Adjust path to your virtual environment
pip install -r requirements.txt

python  get_direct_transfer_rate.py
