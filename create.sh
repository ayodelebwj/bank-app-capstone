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

sleep 90

eksctl create addon \
  --cluster banking-app-capstone \
  --name eks-pod-identity-agent

eksctl create podidentityassociation \
  --cluster banking-app-capstone \
  --namespace kube-system \
  --service-account-name ebs-csi-controller-sa \
  --role-name AmazonEKS_EBS_CSI_DriverRole \
  --permission-policy-arns arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy

eksctl create addon \
  --cluster banking-app-capstone \
  --name aws-ebs-csi-driver

eksctl utils migrate-to-pod-identity