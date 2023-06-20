#!/bin/bash
shopt -s expand_aliases
alias mc='docker-compose exec mc mc'

# prepare model store for serving with torchserve
# populate models for "Image Classification" task on "ImageNet" dataset
wget --continue -P model-store \
    https://torchserve.pytorch.org/mar_files/alexnet.mar \
    https://torchserve.pytorch.org/mar_files/densenet161.mar \
    https://torchserve.pytorch.org/mar_files/resnet-18.mar \
    https://torchserve.pytorch.org/mar_files/vgg16.mar \
    https://torchserve.pytorch.org/mar_files/squeezenet1_1.mar \
    https://torchserve.pytorch.org/mar_files/resnet-152-batch_v2.mar

# bring up minio and mc helper
docker-compose up -d minio mc

# create and populate the model zoo bucket
mc alias set s3 http://minio:9000 minioadmin minioadmin
mc mb s3/zoo
mc cp model-store/resnet-18.mar s3/zoo

# bring minio and mc back down
docker-compose down