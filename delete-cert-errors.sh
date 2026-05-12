#!/bin/bash
kubectl delete certificate app-cert
kubectl delete certificaterequest --all
kubectl delete order --all
kubectl delete challenge --all