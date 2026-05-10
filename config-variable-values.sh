#!/bin/bash
kubectl get sa -n default  #  get name space
aws sts get-caller-identity --query Account --output text # get account id
aws eks describe-cluster --name banking-app-capstone --query "cluster.identity.oidc.issuer" --output text # get 

https://oidc.eks.us-east-1.amazonaws.com/id/3097FEA2C803A04CD3335601E6700F62
olaniyikolawole@MacBookPro BankingApp % 
