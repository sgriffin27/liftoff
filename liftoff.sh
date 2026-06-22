#!/bin/bash
#SBATCH --job-name=liftoff.%j.job
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=seg75580@uga.edu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=50gb
#SBATCH --time=48:00:00
#SBATCH --output=liftoff.%j.out
#SBATCH --error=liftoff.%j.err

cd $SLURM_SUBMIT_DIR

module spider Liftoff/1.6.3
liftofftools all -r /home/seg75580/AfuGenomes/AF293_AspergillusFumagatis_GCF_000002655.1GCF_000002655.1_ASM265v1_genomic.fna -t /home/seg75580/AfuGenomes/GCF_000002655.1_ASM265v1_TR46.fasta /
-rg /home/seg75580/AfuGenomes/AF293_AspergillusFumagatis_GCF_000002655.1/GCF_000002655.1_ASM265v1_genomic.gff -tg /home/seg75580/AfuGenomes/GCF_000002655.1_ASM265v1_TR46.gff
