# TorchServe

### Run

Download models from the [TorchServe Model Zoo](https://pytorch.org/serve/model_zoo.html) to the model-store directory.

Start the server:
```
docker-compose up
```

Register the models:
```
curl -v -X POST "http://localhost:8081/models?initial_workers=1&synchronous=true&url=/home/model-server/model-store/fastrcnn.mar"
curl -v -X POST "http://localhost:8081/models?initial_workers=1&synchronous=true&url=/home/model-server/model-store/alexnet.mar"
```

Inference:
```
curl http://127.0.0.1:8080/predictions/fastrcnn -T 3dogs.jpg
curl http://127.0.0.1:8080/predictions/alexnet -T 3dogs.jpg
```


### TorchServe References

- [TorchServe](https://pytorch.org/serve/index.html)
- [TorchServe Model Zoo](https://pytorch.org/serve/model_zoo.html)
- [TorchServe Docker](https://github.com/pytorch/serve/tree/master/docker)
