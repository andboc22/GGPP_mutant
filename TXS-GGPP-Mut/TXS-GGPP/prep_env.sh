#!/bin/bash

source $1/amber22/amber.sh

parmchk2 -i ligand_files/GGP.mol2 -f mol2 -o ligand_files/GGP.frcmod

cd Prep_environment
$1/amber22/bin/tleap -f GGP.in
$1/amber22/bin/tleap -f complex.in
cd ..

ambpdb -p TXS-GGPP.prmtop -c TXS-GGPP.inpcrd > TXS-GGPP_solvated.pdb
