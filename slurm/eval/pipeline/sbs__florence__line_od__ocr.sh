#!/bin/bash -l

#SBATCH -A uppmax2020-2-2
#SBATCH -M snowy
#SBATCH -p node
#SBATCH -N 1
#SBATCH -t 24:00:00
#SBATCH -J eval/pipeline/sbs__florence__line_od__ocr
#SBATCH -o logs_uppmax/eval/pipeline/sbs__florence__line_od__ocr.out
#SBATCH -e logs_uppmax/eval/pipeline/sbs__florence__line_od__ocr.out
#SBATCH --gres=gpu:1
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=hoang-ha.pham.1833@student.uu.se


source activate /crex/proj/uppmax2024-2-24/hapham/envs/vlm
PROJECT_DIR=/proj/uppmax2024-2-24/hapham/vlm
cd $PROJECT_DIR

python pipelines/eval/eval_pipeline_florence__line_od__ocr.py \
    --split-type sbs \
    --batch-size 4