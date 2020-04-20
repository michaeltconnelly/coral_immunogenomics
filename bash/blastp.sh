#!/bin/bash
#purpose: Conduct blastp searched against NCBI RefSeq cnidarian genome assemblies

#BSUB -J cnid_blastp
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -o blastp%J.out
#BSUB -e blastp%J.err
#BSUB -n 8
#BSUB -u m.connelly1@umiami.edu

module load blast/2.2.29+
prodir="/scratch/projects/transcriptomics/mikeconnelly/projects/coral_immunogenomics"

/share/apps/blast+/2.2.29/bin/blastp \
-db ${prodir}/data/blastdb_protein_all \
-query ${prodir}/query/nfkb.fasta \
-out ${prodir}/outputs/blastdb_protein_all
