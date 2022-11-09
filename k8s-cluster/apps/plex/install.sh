#!/bin/sh

helm repo add truecharts https://charts.truecharts.org/
helm repo update

helm install my-plex truecharts/plex \
  --set env.TZ="Australia/Sydney"

# helm install plex kube-plex/charts/kube-plex/ \
#   --values values.yml \
#   --namespace media
