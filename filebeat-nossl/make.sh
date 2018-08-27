#!/bin/bash
# @author sunyu
# this script is used to build filebeat container.

REGISTRY=docker-server.com
IMAGE=filebeat-nossl
TAG=1.0.0

# ========================= build docker images =======================
docker build -t ${IMAGE}:${TAG} -t ${REGISTRY}/${IMAGE}:${TAG} .
# ========================= push images ===============================
docker login -u admin -p Harbor12345 docker-server.com
docker push ${REGISTRY}/${IMAGE}:${TAG}
