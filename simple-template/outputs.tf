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
  value       = google_container_cluster.primary.name
}

output "kubernetes_cluster_host" {
  description = "GKE Cluster Host"
  sensitive   = true
  value       = google_container_cluster.primary.endpoint
}

output "gcloud_gke_get_creds" {
  description = "Command to get GKE credentials"
  value       = "gcloud container clusters get-credentials ${google_container_cluster.primary.name} --zone ${google_container_cluster.primary.location} --project ${var.project}"
}

output "gcloud_vpc_link" {
  description = "VPC web ui link"
  value       = "https://console.cloud.google.com/networking/networks/list?project=${var.project}"
}

output "gcloud_gke_link" {
  description = "GKE web ui link"
  value       = "https://console.cloud.google.com/kubernetes/clusters/details/${var.region}/${local.cluster_name}/details?project=${var.project}"
}
