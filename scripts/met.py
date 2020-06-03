from nanocompore.SampCompDB import SampCompDB, jhelp

db = SampCompDB (
    db_fn = "/home/andrey/anna/methilation3/simulated_SampComp.db",
    fasta_fn = "/home/andrey/minimap2/Ppatens_318_v3.fa")

# Print general metadata information
print (db)

# Prit list of references containing valid data
print (db.ref_id_list)
