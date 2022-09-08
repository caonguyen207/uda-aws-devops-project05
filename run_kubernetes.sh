#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1: This is your Docker ID/path
dockerpath=caonguyenle007/ml-training:latest

# Step 2: Run the Docker Hub container with kubernetes
aws eks update-kubeconfig --region us-east-1 --name uda-aws
kubectl 

# Step 3: List kubernetes pods
kubectl get pods -n default -o wide

# Step 4: Forward the container port to a host
# kubectl expose pod <pod-name> --port=80 --name=ml-training-svc

