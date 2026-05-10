#!/bin/bash

set -e

CLUSTER_NAME=banking-app-capstone
REGION=us-east-1

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