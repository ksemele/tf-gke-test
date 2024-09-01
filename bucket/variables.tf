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

variable "iam_user_email" {
  type        = string
  description = "Your gcloud account"
  default     = "demo@gmail.com"
}
