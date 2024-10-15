terraform {
  required_version = "~>1.9"

  required_providers {
    # https://github.com/hashicorp/terraform-provider-google
    google = {
      source  = "hashicorp/google"
      version = "~>5.42.0"
    }
    # https://github.com/hashicorp/terraform-provider-kubernetes
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.32.0"
    }
  }
}
