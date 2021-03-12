#!/bin/sh

set -ex

STACK="openebs"
CHART="openebs/openebs"
CHART_VERSION="2.6.0"
NAMESPACE="openebs"

if [ -z "${MP_KUBERNETES}" ]; then
  VALUES="values.yaml"
else
  VALUES="https://raw.githubusercontent.com/digitalocean/marketplace-kubernetes/master/stacks/${STACK}/values.yaml"
fi


helm repo add openebs https://openebs.github.io/charts
helm repo update

helm install "$CHART" \
  --create-namespace \
  --generate-name \
  --namespace "$NAMESPACE" \
  --values "$VALUES" \
  --version "$CHART_VERSION" \
  --wait
