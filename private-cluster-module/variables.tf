variable "project" {
  type        = string
  description = "Google Project to create resources in"
  default     = "demo"
}

variable "region" {
  type        = string
  description = "The region to host the cluster in"
  default     = "europe-west1"
}

variable "zone" {
  type        = string
  description = "The region to host the cluster in"
  default     = "europe-west1-b"
}

variable "environment_name" {
  type        = string
  description = "Environment name"
  default     = "demo"
}

variable "host_project" {
  type        = string
  description = "The GCP project housing the VPC network to host the cluster in"
  default     = "demo"
}

variable "vpc_network" {
  type        = string
  description = "The GCP network to apply firewall rules in"
  default     = "demo-vpc"
}

variable "master_authorized_networks" {
  type        = list(object({ cidr_block = string, display_name = string }))
  description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
  default = [
    { cidr_block = "1.1.1.1/32", display_name = "Use your IP/VPN IP here" },
  ]
}

# Google bucket for terraform state

variable "bucket_name" {
  type        = string
  description = "Bucket name"
  default     = "your-project-bucket"
}

variable "bucket_prefix" {
  type        = string
  description = "Path to store your state in bucket"
  default     = "terraform/state/demo"
}

variable "bucket_credentials_json" {
  type        = string
  description = "Default path to your gcloud credentials json file"
  default     = "~/.config/gcloud/application_default_credentials.json"
}
