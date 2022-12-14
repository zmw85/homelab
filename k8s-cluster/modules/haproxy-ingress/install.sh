#!/bin/sh
helm repo add haproxy-ingress https://haproxy-ingress.github.io/charts

helm install haproxy-ingress haproxy-ingress/haproxy-ingress\
  --create-namespace --namespace ingress-controller\
  --version 0.13.9\
  -f haproxy-ingress-values.yaml