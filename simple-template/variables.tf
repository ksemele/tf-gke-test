variable "project" {
  type        = string
  description = "Google Project to create resources in"
  default     = "demo"
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
