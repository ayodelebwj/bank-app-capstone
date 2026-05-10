#!/bin/bash

set -e

CLUSTER_NAME=banking-app-capstone
REGION=us-east-1

echo "Installing ingress..."
helm repo list | grep bitnami && helm repo remove bitnami || true
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx || true
helm repo update
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --set controller.service.type=LoadBalancer
