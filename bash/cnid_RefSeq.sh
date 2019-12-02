#!/bin/bash
#BSUB -J cnid_genomes_RefSeq
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -o cnid_RefSeq%J.out
#BSUB -e cnid_RefSeq%J.err
#BSUB -n 8
#BSUB -u m.connelly1@umiami.edu

#~/scripts/coral_genomics/cnid_RefSeq.sh
#/scratch/projects/transcriptomics/mikeconnelly/scripts/coral_genomics/cnid_RefSeq.sh
#purpose: download cnidarian genome assemblies from NCBI RefSeq to Pegasus

#A. digitifera
rsync --copy-links --recursive --times --verbose \
rsync://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/222/465/GCF_000222465.1_Adig_1.1 \
/scratch/projects/transcriptomics/mikeconnelly/sequences/genomes/coral

#A. millepora
rsync --copy-links --recursive --times --verbose \
rsync://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/004/143/615/GCF_004143615.1_amil_sf_1.1 \
/scratch/projects/transcriptomics/mikeconnelly/sequences/genomes/coral

#S. pistillata
rsync --copy-links --recursive --times --verbose \
rsync://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/571/385/GCF_002571385.1_Stylophora_pistillata_v1 \
/scratch/projects/transcriptomics/mikeconnelly/sequences/genomes/coral

#P. damicornis
rsync --copy-links --recursive --times --verbose \
rsync://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/003/704/095/GCF_003704095.1_ASM370409v1 \
/scratch/projects/transcriptomics/mikeconnelly/sequences/genomes/coral

#O. faveolata
rsync --copy-links --recursive --times --verbose \
rsync://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/042/975/GCF_002042975.1_ofav_dov_v1 \
/scratch/projects/transcriptomics/mikeconnelly/sequences/genomes/coral

#D. gigantea
rsync --copy-links --recursive --times --verbose \
rsync://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/004/324/835/GCF_004324835.1_DenGig_1.0 \
/scratch/projects/transcriptomics/mikeconnelly/sequences/genomes/coral

#E. pallida
rsync --copy-links --recursive --times --verbose \
rsync://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/001/417/965/GCF_001417965.1_Aiptasia_genome_1.1 \
/scratch/projects/transcriptomics/mikeconnelly/sequences/genomes/coral

#N. vectensis
rsync --copy-links --recursive --times --verbose \
rsync://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/209/225/GCF_000209225.1_ASM20922v1 \
/scratch/projects/transcriptomics/mikeconnelly/sequences/genomes/coral
