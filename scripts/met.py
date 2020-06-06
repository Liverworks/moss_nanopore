from nanocompore.SampCompDB import SampCompDB, jhelp

# Recommended NanosampComp script
jhelp(SampCompDB)
db = SampCompDB(db_fn = "out_SampComp.db", fasta_fn = "/media/ilia/anna/transcriptome_dupl.fa", log_level="warning")
db.save_report(output_fn="report.tsv")
db.save_shift_stats (output_fn="shift.tsv")
db = SampCompDB(db_fn = "out_SampComp.db", fasta_fn = "/media/ilia/anna/transcriptome_dupl.fa", bed_fn="/home/andrey/anna/annot_genes.bed")
db.save_to_bed (output_fn="sig_positions.bed", pvalue_field="KS_intensity_pvalue")
