#!/usr/bin/env python

# This is an automatically generated script to run your query
# to use it you will require the intermine python client.
# To install the client, run the following command from a terminal:
#
#     sudo easy_install intermine
#
# For further documentation you can visit:
#     http://intermine.readthedocs.org/en/latest/web-services/

# The following two lines will be needed in every python script:
from intermine.webservice import Service
service = Service("https://phytozome.jgi.doe.gov/phytomine/service")

# Look up the GO terms associated with a gene, or use a saved list of genes and
# look up the GO terms associated with all genes on the list.

template = service.get_template('GO-Annotations')

# You can edit the constraint values below
# A    Gene.primaryIdentifier
with open("genes_polya_frompac", "r") as l:

    for i in l.readlines():
        # print i
        rows = template.rows(
            A = {"op": "=", "value": str(i.strip())}
        )
        for row in rows:
            # print "1"
            print row["primaryIdentifier"], "\t", row["secondaryIdentifier"], row["length"], "\t", \
                row["chromosomeLocation.start"], "\t", row["chromosomeLocation.end"], "\t", \
                row["goAnnotation.ontologyTerm.identifier"], "\t", row["goAnnotation.ontologyTerm.name"], "\t", \
                row["goAnnotation.ontologyTerm.description"], "\t", row["briefDescription"]

