#!/bin/bash

export MODEL_DIR=/root/v0.5/classification_and_detection/dataset
export DATA_DIR=/root/v0.5/classification_and_detection/dataset/dataset-coco-2017-val

echo "run_common"
source ./run_common.sh

echo "common_opt"
common_opt="--config /root/v0.5/mlperf.conf"
dataset="--dataset-path $DATA_DIR"

cd /root

echo "output"
OUTPUT_DIR=`pwd`/output/$name
if [ ! -d $OUTPUT_DIR ]; then
    mkdir -p $OUTPUT_DIR
fi

cd /root

start_fmt=$(date +%Y-%m-%d\ %r)
echo "STARTING RUN AT $start_fmt"

echo "python_main"
python v0.5/classification_and_detection/python/main.py --profile $profile $common_opt --model $model_path $dataset \
    --output $OUTPUT_DIR $EXTRA_OPS $@

end_fmt=$(date +%Y-%m-%d\ %r)
echo "ENDING RUN AT $end_fmt"
