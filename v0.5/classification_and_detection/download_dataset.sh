#!/bin/bash

mkdir dataset

cd dataset

wget -q https://zenodo.org/record/3239977/files/ssd_mobilenet_v1.pytorch

pwd

python -m pip install ck

ck version

ck pull repo:ck-env

echo "install"

ck install package --tags=image-classification,dataset,imagenet,val,original,full
ck install package --tags=image-classification,dataset,imagenet,aux

echo "locate"

ck locate env --tags=image-classification,dataset,imagenet,val,original,full
ck locate env --tags=image-classification,dataset,imagenet,aux

echo "copy"

cp `ck locate env --tags=aux`/val.txt `ck locate env --tags=val`/val_map.txt

pwd
ls -lt

echo "coco"
ck install package --tags=object-detection,dataset,coco,2017,val,original
ck locate env --tags=object-detection,dataset,coco,2017,val,original

pwd
ls -lt

cp -r /tekton/home/CK-TOOLS/* /root/v0.5/classification_and_detection/dataset/

ls -lt /tekton/home/CK-TOOLS/
ls -lt /tekton/home/CK-TOOLS/dataset-coco-2017-val
ls -lt /root/v0.5/classification_and_detection/
ls -lt /root/v0.5/classification_and_detection/dataset/

