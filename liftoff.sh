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

module load Liftoff/1.6.3
module load minimap2/2.24-GCCcore-11.3.0

liftoff -g /home/seg75580/AfuGenomes/genomicver2.gff -f /scratch/seg75580/liftoff/features.txt /home/seg75580/AfuGenomes/GCF_000002655.1_ASM265v1_TR46.fasta /home/seg75580/AfuGenomes/GCF_000002655.1_ASM265v1_genomicver2.fasta -o /scratch/seg75580/liftoff/TR46_liftover.gff

#to make gtf from the gff you just generated
module load gffread/0.12.7-GCCcore-12.3.0

gffread input.gff -T -o output.gtf



