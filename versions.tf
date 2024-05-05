terraform {
  required_version = "~>1.7.0"

  required_providers {
    google = {
      source  = "hashicorp/google" # https://github.com/hashicorp/terraform-provider-google
      version = "~>5.27.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes" # https://github.com/hashicorp/terraform-provider-kubernetes
      version = "~>2.29.0"
    }
  }
}
