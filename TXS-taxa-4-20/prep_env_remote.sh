#!/bin/bash
#SBATCH --cpus-per-task=1 
#SBATCH --gpus-per-node=1 
#SBATCH --mem-per-cpu=2000 
#SBATCH --time=10:0:0  
module purge
module load StdEnv/2020 gcc/9.3.0 cuda/11.4 openmpi/4.0.3 amber/20.12-20.15

parmchk2 -i ligand_files/PPO.mol2 -f mol2 -o ligand_files/PPO.frcmod
parmchk2 -i ligand_files/TAX.mol2 -f mol2 -o ligand_files/TAX.frcmod

cd Prep_environment
tleap -f PPO.in
tleap -f TAX.in
tleap -f complex.in
cd ..

ambpdb -p TXS-taxa-4-20.prmtop -c TXS-taxa-4-20.inpcrd > TXS-taxa-4-20_solvated.pdb
