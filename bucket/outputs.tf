output "region" {
  description = "GCloud Region"
  value       = var.region
}

output "project" {
  description = "GCloud Project ID"
  value       = var.project
}

output "gcloud_bucket_link" {
  description = "Bucket web ui link"
  value       = "https://console.cloud.google.com/storage/browser/${module.bucket.name};tab=objects?forceOnBucketsSortingFiltering=true&project=${var.project}&prefix=&forceOnObjectsSortingFiltering=false"
}
