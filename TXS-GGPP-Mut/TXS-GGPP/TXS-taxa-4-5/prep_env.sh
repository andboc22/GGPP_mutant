#!/bin/bash

source $1/amber22/amber.sh

parmchk2 -i ligand_files/PPO.mol2 -f mol2 -o ligand_files/PPO.frcmod
parmchk2 -i ligand_files/TAX.mol2 -f mol2 -o ligand_files/TAX.frcmod

cd Prep_environment
$1/amber22/bin/tleap -f PPO.in
$1/amber22/bin/tleap -f TAX.in
$1/amber22/bin/tleap -f complex.in
cd ..

ambpdb -p TXS-taxa-4-5.prmtop -c TXS-taxa-4-5.inpcrd > TXS-taxa-4-5_solvated.pdb
