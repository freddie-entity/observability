#!/bin/sh

helm template \
    --dependency-update \
    --include-crds \
    --namespace $1 \
    $1 . \
    --create-namespace=true \
    | kubectl apply -n $1 -f -
