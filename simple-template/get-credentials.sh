#!/bin/bash

if grep -H "opentofu.org" .terraform.lock.hcl > /dev/null; then
    echo "trying to read tofu state"
    gcloud container clusters get-credentials $(tofu output -raw kubernetes_cluster_name) --zone $(tofu output -raw zone) --project $(tofu output -raw project)
else
    echo "trying to read terraform state"
    gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --zone $(terraform output -raw zone) --project $(terraform output -raw project)
fi
