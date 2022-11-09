#!/bin/sh

helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/

helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard \
  -f values.yml \
  -n kubernetes-dashboard