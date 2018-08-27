#!/bin/bash
# @author sunyu
# this script is used to build filebeat container.

REGISTRY=docker-server.com
PROJECT=test
IMAGE=filebeat-nossl
TAG=5.5

# ========================= build docker images =======================
docker build -t ${IMAGE}:${TAG} -t ${REGISTRY}/${PROJECT}/${IMAGE}:${TAG} .
# ========================= push images ===============================
docker login -u admin -p Harbor12345 docker-server.com
docker push ${REGISTRY}/${PROJECT}/${IMAGE}:${TAG}
