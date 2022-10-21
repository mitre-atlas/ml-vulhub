#!/bin/bash
shopt -s expand_aliases
alias mc='docker-compose exec mc mc'

# populate model store for serving with torchserve
wget --continue -P model-store https://torchserve.pytorch.org/mar_files/resnet-18.mar

# bring up minio and mc helper
docker-compose up -d minio mc

# create and populate the model zoo bucket
mc alias set ml http://minio:9000 minioadmin minioadmin
mc mb ml/zoo
mc cp model-store/resnet-18.mar ml/zoo

# bring minio and mc back down
docker-compose down
