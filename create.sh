#!/bin/bash
set -e

CLUSTER_NAME=banking-app-capstone
REGION=us-east-1

echo "Deleting old cluster if it exists..."
eksctl delete cluster --name $CLUSTER_NAME --region $REGION || true

echo "Creating cluster..."
eksctl create cluster \
  --name $CLUSTER_NAME \
  --region $REGION \
  --node-type t3.large \
  --nodes 2 \
  --managed \
  --with-oidc


