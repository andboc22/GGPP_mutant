#!/bin/bash
#SBATCH --cpus-per-task=1 
#SBATCH --gpus-per-node=1 
#SBATCH --mem-per-cpu=2000 
#SBATCH --time=10:0:0  
module purge
module load StdEnv/2020 gcc/9.3.0 cuda/11.4 openmpi/4.0.3 amber/20.12-20.15

parmchk2 -i ligand_files/GGP.mol2 -f mol2 -o ligand_files/GGP.frcmod

cd Prep_environment
tleap -f GGP.in
tleap -f complex.in
cd ..

ambpdb -p TXS-GGPP.prmtop -c TXS-GGPP.inpcrd > TXS-GGPP_solvated.pdb
