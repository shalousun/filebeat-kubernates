all: build push

REGISTRY=docker-server.com
IMAGE=filebeat-nossl
TAG=1.0.0

build:
      	docker build -t $(IMAGE):$(TAG) -t $(REGISTRY)/$(IMAGE):$(TAG) .
        docker build -t $(IMAGE):$(TAG) -t $(REGISTRY)/$(IMAGE):latest .

push:
        docker login -u admin -p Harbor12345 docker-server.com
     	docker push $(REGISTRY)/$(IMAGE):$(TAG)
        docker push $(REGISTRY)/$(IMAGE):latest