#!/bin/bash
gcloud container clusters get-credentials $(tofu output -raw kubernetes_cluster_name) --region $(tofu output -raw zone) --project $(tofu output -raw project)
