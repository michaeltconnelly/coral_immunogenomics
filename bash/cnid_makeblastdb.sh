#!/bin/bash
#BSUB -J cnid_genomes_blastdb
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -o cnid_blastdb%J.out
#BSUB -e cnid_blastdb%J.err
#BSUB -n 8
#BSUB -u m.connelly1@umiami.edu

#~/scripts/coral_genomics/cnid_blastdb.sh
#/scratch/projects/transcriptomics/mikeconnelly/scripts/coral_genomics/cnid_blastdb.sh
#purpose: Create blast databases from  NCBI RefSeq cnidarian genome assemblies

module load blast/2.2.29+
prodir="/scratch/projects/transcriptomics/mikeconnelly/projects/coral_immunogenomics"
gendir="/scratch/projects/transcriptomics/mikeconnelly/sequences/genomes/coral"
#9 RefSeq genome assemblies
refseqs="GCF_000222465.1_Adig_1.1 GCF_004143615.1_amil_sf_1.1 GCF_002571385.1_Stylophora_pistillata_v1 GCF_003704095.1_ASM370409v1 GCF_002042975.1_ofav_dov_v1 GCF_004324835.1_DenGig_1.0 GCF_001417965.1_Aiptasia_genome_1.1 GCF_000209225.1_ASM20922v1 GCF_000004095.1_Hydra_RP_1.0"
for refseq in $refseqs
do
  gunzip ${gendir}/${refseq}/${refseq}_genomic.fna.gz
  gunzip ${gendir}/${refseq}/${refseq}_protein.faa.gz
done

#Nucleotide blast databases from genomic fasta files
/share/apps/blast+/2.2.29/bin/makeblastdb \
-dbtype 'nucl'\
-in ${gendir}/GCF_000222465.1_Adig_1.1/GCF_000222465.1_Adig_1.1_genomic.fna \
${gendir}/GCF_004143615.1_amil_sf_1.1/GCF_004143615.1_amil_sf_1.1_genomic.fna \
${gendir}/GCF_002571385.1_Stylophora_pistillata_v1/GCF_002571385.1_Stylophora_pistillata_v1_genomic.fna \
${gendir}/GCF_003704095.1_ASM370409v1/GCF_003704095.1_ASM370409v1_genomic.fna \
${gendir}/GCF_002042975.1_ofav_dov_v1/GCF_002042975.1_ofav_dov_v1_genomic.fna \
${gendir}/GCF_004324835.1_DenGig_1.0/GCF_004324835.1_DenGig_1.0_genomic.fna \
${gendir}/GCF_001417965.1_Aiptasia_genome_1.1/GCF_001417965.1_Aiptasia_genome_1.1_genomic.fna \
${gendir}/GCF_000209225.1_ASM20922v1/GCF_000209225.1_ASM20922v1_genomic.fna \
-input_type 'fasta' \
-out ${gendir}/cnid_RefSeq_nucblastdb \
-max_file_sz "4GB"

#Protein blast databases from protein fasta files
/share/apps/blast+/2.2.29/bin/makeblastdb \
-dbtype 'prot'\
-in ${gendir}/GCF_000222465.1_Adig_1.1/GCF_000222465.1_Adig_1.1_protein.faa \
${gendir}/GCF_004143615.1_amil_sf_1.1/GCF_004143615.1_amil_sf_1.1_protein.faa \
${gendir}/GCF_002571385.1_Stylophora_pistillata_v1/GCF_002571385.1_Stylophora_pistillata_v1_protein.faa \
${gendir}/GCF_003704095.1_ASM370409v1/GCF_003704095.1_ASM370409v1_protein.faa \
${gendir}/GCF_002042975.1_ofav_dov_v1/GCF_002042975.1_ofav_dov_v1_protein.faa \
${gendir}/GCF_004324835.1_DenGig_1.0/GCF_004324835.1_DenGig_1.0_protein.faa \
${gendir}/GCF_001417965.1_Aiptasia_genome_1.1/GCF_001417965.1_Aiptasia_genome_1.1_protein.faa \
${gendir}/GCF_000209225.1_ASM20922v1/GCF_000209225.1_ASM20922v1_protein.faa \
-input_type 'fasta' \
-out ${gendir}/cnid_RefSeq_protblastdb \
-max_file_sz "4GB"
