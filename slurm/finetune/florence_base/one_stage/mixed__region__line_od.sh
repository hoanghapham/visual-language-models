#!/bin/bash -l

#SBATCH -A uppmax2020-2-2
#SBATCH -M snowy
#SBATCH -p node
#SBATCH -N 1
#SBATCH -t 3-00:00
#SBATCH -J finetune/florence_base/mixed__region__line_od
#SBATCH -o logs_uppmax/finetune/florence_base/mixed__region__line_od.out
#SBATCH -e logs_uppmax/finetune/florence_base/mixed__region__line_od.out
#SBATCH --gres=gpu:1
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=hoang-ha.pham.1833@student.uu.se


source activate /crex/proj/uppmax2024-2-24/hapham/envs/vlm
PROJECT_DIR=/proj/uppmax2024-2-24/hapham/vlm

cd $PROJECT_DIR

python pipelines/train/finetune_florence__region__line_od.py \
    --data-dir $PROJECT_DIR/data/page/mixed \
    --model-name florence_base__mixed__region__line_od \
    --num-train-epochs 10 \
    --max-train-steps 140000 \
    --batch-size 2 \
    --logging-interval 14000 
