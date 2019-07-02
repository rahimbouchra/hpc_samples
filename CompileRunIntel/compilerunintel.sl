#!/bin/bash
#SBATCH -J MyCode
#SBATCH -o %x-%j.out
#SBATCH -e %x-%j.err
#SBATCH --partition=shortq

source /cm/shared/apps/intel/ips_2017/bin/compilervars.sh -arch intel64


#prepare work_dir
export WORK_DIR=/data/$USER/workdir
export INPUT_DIR=$PWD/code_and_input
mkdir -p $WORK_DIR
cp -R $INPUT_DIR/* $WORK_DIR
cd $WORK_DIR

echo "Running code on $WORK_DIR"
ifort -o myfortran.out myfortrancode.f
chmod +x myfortran.out
./myfortran.out

echo "Done"
