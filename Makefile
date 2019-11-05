DOCKER_IMAGE_NAME ?= chesnovsky/chesnovskyru
DOCKER_IMAGE_TAG ?= 1.0

build: Dockerfile
	docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) .
