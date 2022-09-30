# MinIO

MinIO is an S3 compatable object store.

We use it here to setup object stores to host ML training data and model zoos.

### Example

Install mc:
```
curl https://dl.min.io/client/mc/release/linux-amd64/mc \
    --create-dirs \
    -o $HOME/minio-binaries/mc

chmod +x $HOME/minio-binaries/mc
export PATH=$PATH:$HOME/minio-binaries/
```

Start the server:
```
docker-compose up
```

Populate the object store:
```
# setup client to access the minio instance
mc alias set ml http://localhost:9000 minioadmin minioadmin

# create a bucket to host a model zoo
mc mb ml/zoo

# download model and copy it to the zoo bucket
wget https://download.pytorch.org/models/resnet18-f37072fd.pth
mc cp resnet18-f37072fd.pth  ml/zoo
```
