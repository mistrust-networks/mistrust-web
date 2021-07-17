IMAGE_TAG?=latest
IMAGE_NAMESPACE?=quay.io/jannfis
IMAGE_NAME=jekyll-site-builder

all: image

image:
	docker build -t ${IMAGE_NAMESPACE}/${IMAGE_NAME}:${IMAGE_TAG} .

image-push:
	docker push ${IMAGE_NAMESPACE}/${IMAGE_NAME}:${IMAGE_TAG}
