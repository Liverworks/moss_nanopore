#!/bin/bash

~/minimap2/minimap2 -ax splice -uf -k14 -G10k -t 10 --secondary=no /media/ilia/anna/nanomoss.fasta /home/andrey/$1/*.fastq > $1.sam;
samtools flagstat $1.sam;
samtools view -bS $1.sam > $1.bam; 
samtools sort $1.bam -o $1_sorted.bam;
samtools index $1_sorted.bam;
bedtools bamtobed -i $1_sorted.bam > $1.bed;
bedtools merge -s -n -i $1.bed > merge_$1.bed;
samtools mpileup -C50 -uf ~/minimap2/Ppatens_318_v3.fa $1_sorted.bam > $1.mpileup;
bcftools call -c $1.mpileup > $1.vcf;
gzip $1.vcf;

