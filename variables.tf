variable "project" {
  description = "Google Project to create resources in"
  type        = string
  default     = "demo"
}

variable "vpc_host_project" {
  description = "Host Project where virtual network exists"
  type        = string
  default     = "demo"
}

variable "environment_name" {
  type    = string
  default = "demo"
}

variable "region" {
  type        = string
  description = "The region to host the cluster in"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "The region to host the cluster in"
  default     = "us-central1-b"
}
