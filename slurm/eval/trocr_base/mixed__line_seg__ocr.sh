#!/bin/bash -l

#SBATCH -A uppmax2020-2-2
#SBATCH -M snowy
#SBATCH -p node
#SBATCH -N 1
#SBATCH -t 1-00:00
#SBATCH -J eval/trocr_base/mixed__line_seg__ocr
#SBATCH -o logs_uppmax/eval/trocr_base/mixed__line_seg__ocr.out
#SBATCH -e logs_uppmax/eval/trocr_base/mixed__line_seg__ocr.out
#SBATCH --gres=gpu:1
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=hoang-ha.pham.1833@student.uu.se


source activate /crex/proj/uppmax2024-2-24/hapham/envs/vlm
PROJECT_DIR=/proj/uppmax2024-2-24/hapham/vlm

cd $PROJECT_DIR

python pipelines/eval/eval_trocr_ocr.py \
    --model-name trocr_base__mixed__line_seg__ocr \
    --data-dir $PROJECT_DIR/data/line_seg/mixed/test/ \
    --checkpoint best \
    --batch-size 10