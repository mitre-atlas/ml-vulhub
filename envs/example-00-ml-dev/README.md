This example mimics an ML developer's environment.

The environment consists of:
- `devbox`: an ubuntu container representing the compromised developer machine
- `torchserve`: a hosted image classification model
- `minio`: an object store with a model zoo. Note: `mc` is used as a helper to populate the model zoo

run `./init.sh` once to download models and populate the object store

run `docker-compose up` to bring up the environment

run `docker-compose exec mldev bash` to get a shell on the compromised developer machine
