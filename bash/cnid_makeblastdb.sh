#!/bin/bash
#~/projects/coral_immunogenomics/bash/cnid_blastdb.sh
#/scratch/projects/transcriptomics/mikeconnelly/projects/coral_immunogenomics/bash/cnid_makeblastdb.sh
#purpose: Create blast databases from  NCBI RefSeq cnidarian genome assemblies

#BSUB -J cnid_genomes_blastdb
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -o cnid_blastdb%J.out
#BSUB -e cnid_blastdb%J.err
#BSUB -n 8
#BSUB -u m.connelly1@umiami.edu

module load blast/2.2.29+
prodir="/scratch/projects/transcriptomics/mikeconnelly/projects/coral_immunogenomics"

#9 RefSeq genome assemblies
refs="GCF_000222465.1_Adig_1.1 GCF_004143615.1_amil_sf_1.1 GCF_002571385.1_Stylophora_pistillata_v1 GCF_003704095.1_ASM370409v1 GCF_002042975.1_ofav_dov_v1 GCF_004324835.1_DenGig_1.0 GCF_001417965.1_Aiptasia_genome_1.1 GCF_000209225.1_ASM20922v1"
touch ${prodir}/data/proteomes/db_protein_all.faa
for ref in $refs
do
  echo "Concatenating ${ref} into overall protein fasta"
  gunzip ${prodir}/data/proteomes/${ref}_protein.faa.gz
  cat ${prodir}/data/proteomes/${ref}_protein.faa >> ${prodir}/data/proteomes/db_protein_all.faa
  gzip ${prodir}/data/proteomes/${ref}_protein.faa
done

#Protein blast databases from protein fasta files
/share/apps/blast+/2.2.29/bin/makeblastdb \
-dbtype prot \
-parse_seqids \
-in ${prodir}/data/proteomes/db_protein_all.faa \
-input_type 'fasta' \
-out ${prodir}/data/blastdb_protein_all \
-max_file_sz "4GB"
