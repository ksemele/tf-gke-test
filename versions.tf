terraform {
  required_version = "~>1.4.2"

  required_providers {
    google = {
      source  = "hashicorp/google" # https://github.com/hashicorp/terraform-provider-google
      version = "~>4.62.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes" # https://github.com/hashicorp/terraform-provider-kubernetes
      version = "~>2.19.0"
    }
  }
}
