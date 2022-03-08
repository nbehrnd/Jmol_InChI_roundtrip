#!/usr/bin/awk -f

# name:    sort.awk
# author:  nbehrnd@yahoo.com
# license: GPLv2, 2022
# date:    2022-03-03 (YYYY-MM-DD)
# edit:    2022-03-08 (YYYY-MM-DD)

# Jmol's report assigns the round trip either successful (i.e., both
# SMILES and InChI string are invariant), or failing.  By calling this
# awk script in pattern of
#
# awk -f sort.awk report.log
#
# `failing_report.log` and `success_report.log` written provide input
# for a visual inspection by cdkdepict.[1]  The name of this script's
# input file need not be `report.log`.
#
# [1] https://www.simolecule.com/cdkdepict/depict.html

BEGIN {print "Script sorts entries in Jmol's log according to their status."};

{if($2 == "failing"){print $3 "\n" $4 "\n" > "failing_" FILENAME}};
{if($2 == "success"){print $3 > "success_" FILENAME}};

END {print "See CDKdepict: https://www.simolecule.com/cdkdepict/depict.html"};
