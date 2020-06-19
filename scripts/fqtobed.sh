#!/bin/bash

~/minimap2/minimap2 -ax splice -uf -k14 -G2k --secondary=no ~/minimap2/Ppatens_318_v3.fa /home/andrey/$1 > $1.sam;
samtools flagstat $1.sam;
samtools view -bS $1.sam > $1.bam; 
samtools sort $1.bam -o $1_sorted.bam;
bedtools bamtobed -i $1_sorted.bam > $1.bed;
bedtools merge -s -n -i $1.bed > merge_$1.bed


