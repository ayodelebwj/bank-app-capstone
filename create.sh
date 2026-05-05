#!/bin/bash

set -e

eksctl create cluster \
  --name banking-app-capstone \
  --region us-east-1 \
  --node-type t3.small \
  --nodes 2

echo "⏳ Waiting for cluster to be ACTIVE..."
aws eks wait cluster-active \
  --name banking-app-capstone \
  --region us-east-1

eksctl utils associate-iam-oidc-provider \
  --region us-east-1 \
  --cluster banking-app-capstone \
  --approve

echo "⏳ Waiting 30s for IAM propagation..."
sleep 60

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --set controller.service.type=LoadBalancer

# ONLY ONE ADDON YOU CARE ABOUT
aws eks create-addon \
  --cluster-name banking-app-capstone \
  --addon-name aws-ebs-csi-driver \
  --region us-east-1 \
  --resolve-conflicts OVERWRITE

echo "⏳ Waiting for addon..."
aws eks wait addon-active \
  --cluster-name banking-app-capstone \
  --addon-name aws-ebs-csi-driver \
  --region us-east-1

