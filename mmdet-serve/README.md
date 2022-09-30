# mmdet-serve

Serve [MMDetection](https://github.com/open-mmlab/mmdetection) using [TorchServe](https://pytorch.org/serve/).

### Run

```
docker-compose up
```

### Build

```
docker-compose build
```

### Convert Models for Serving

```
docker run --rm -v `pwd`/model-store:/home/model-server/model-store --entrypoint python  mlvulhub/mmdet-serve:latest \
	/home/model-server/mmdet2torchserve.py \
	model-store/configs/faster_rcnn/faster_rcnn_r50_fpn_2x_coco.py model-store/checkpoints/faster_rcnn_r50_fpn_2x_coco_bbox_mAP-0.384_20200504_210434-a5d8aa15.pth \
	--output-folder model-store --model-name faster_rcnn_r50_fpn_2x_coco
```

### MMDetection References:
[mmdet-serve Dockerfile](https://github.com/open-mmlab/mmdetection/tree/master/docker/serve)
[Model Serving](https://github.com/open-mmlab/mmdetection/blob/ca11860f4f3c3ca2ce8340e2686eeaec05b29111/docs/en/useful_tools.md#model-serving)
