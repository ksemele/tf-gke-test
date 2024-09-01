output "region" {
  description = "GCloud Region"
  value       = var.region
}

output "project" {
  description = "GCloud Project ID"
  value       = var.project
}

output "zone" {
  description = "GCloud Project ID"
  value       = var.zone
}

output "kubernetes_cluster_name" {
  description = "GKE Cluster Name"
  value       = module.gke.name
}

output "kubernetes_cluster_host" {
  description = "GKE Cluster Host"
  sensitive   = true
  value       = module.gke.endpoint
}

output "gcloud_gke_get_creds" {
  description = "Command to get GKE credentials"
  value       = "gcloud container clusters get-credentials ${local.cluster_name} --region ${var.region} --project ${var.project}"
}

output "gcloud_vpc_link" {
  description = "VPC web ui link"
  value       = "https://console.cloud.google.com/networking/networks/list?project=${var.project}"
}

output "gcloud_gke_link" {
  description = "GKE web ui link"
  value       = "https://console.cloud.google.com/kubernetes/clusters/details/${var.region}/${local.cluster_name}/details?project=${var.project}"
}

output "master_authorized_networks_config" {
  description = "Here are networks that are allowed to reach your k8s API"
  value       = module.gke.master_authorized_networks_config
}
