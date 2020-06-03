#!/bin/bash

cat /home/andrey/$1/*.fastq > $1_tr.fastq;
~/minimap2/minimap2 -t $2 -ax map-ont -L ~/anna/Ppatens_318_v3.3.transcript.fa  $1_tr.fastq | samtools view -bh -F 2324 -q 10 | samtools sort -O bam > $1_tr.bam;
samtools index $1_tr.bam;
/home/andrey/anna/nanopolish/nanopolish index -s ~/$1/*.txt -d /media/ilia/fast5/$1 $1_tr.fastq;
/home/andrey/anna/nanopolish/nanopolish eventalign -t $2 --reads $1_tr.fastq --bam $1_tr.bam --genome ~/anna/Ppatens_318_v3.3.transcript.fa --samples --print-read-names --scale-events --samples > $1_tr.tsv;
NanopolishComp Eventalign_collapse -i $1_tr.tsv -o $1;
