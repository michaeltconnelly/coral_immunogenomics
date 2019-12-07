#!/bin/bash
#~/projects/coral_immunogenomics/bash/cnid_RefSeq.sh
#/scratch/projects/transcriptomics/mikeconnelly/projects/coral_immunogenomics/bash/cnid_RefSeq.sh
#purpose: standard project directory structure and download cnidarian genome assemblies from NCBI RefSeq to Pegasus

#BSUB -J cnid_genomes_RefSeq
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -o cnid_RefSeq%J.out
#BSUB -e cnid_RefSeq%J.err
#BSUB -n 8
#BSUB -u m.connelly1@umiami.edu

prodir="/scratch/projects/transcriptomics/mikeconnelly/projects/coral_immunogenomics"
refseq="rsync://ftp.ncbi.nlm.nih.gov/genomes/all/GCF"

#A. digitifera
rsync --copy-links --recursive --times --verbose \
${refseq}/000/222/465/GCF_000222465.1_Adig_1.1 \
${prodir}/data/genomes

#A. millepora
rsync --copy-links --recursive --times --verbose \
${refseq}/004/143/615/GCF_004143615.1_amil_sf_1.1 \
${prodir}/data/genomes

#S. pistillata
rsync --copy-links --recursive --times --verbose \
${refseq}/002/571/385/GCF_002571385.1_Stylophora_pistillata_v1 \
${prodir}/data/genomes

#P. damicornis
rsync --copy-links --recursive --times --verbose \
${refseq}/003/704/095/GCF_003704095.1_ASM370409v1 \
${prodir}/data/genomes

#O. faveolata
rsync --copy-links --recursive --times --verbose \
${refseq}/002/042/975/GCF_002042975.1_ofav_dov_v1 \
${prodir}/data/genomes

#D. gigantea
rsync --copy-links --recursive --times --verbose \
${refseq}/004/324/835/GCF_004324835.1_DenGig_1.0 \
${prodir}/data/genomes

#E. pallida
rsync --copy-links --recursive --times --verbose \
${refseq}/001/417/965/GCF_001417965.1_Aiptasia_genome_1.1 \
${prodir}/data/genomes

#N. vectensis
rsync --copy-links --recursive --times --verbose \
${refseq}/000/209/225/GCF_000209225.1_ASM20922v1 \
${prodir}/data/genomes
