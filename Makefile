IMAGE_TAG			?= latest
IMAGE_NAMESPACE		?= quay.io/jannfis
IMAGE_NAME			?= jekyll-site-builder
SUDO				?= sudo

all: image

image:
	${SUDO} docker build -t ${IMAGE_NAMESPACE}/${IMAGE_NAME}:${IMAGE_TAG} .

image-push:
	${SUDO} docker push ${IMAGE_NAMESPACE}/${IMAGE_NAME}:${IMAGE_TAG}
