terraform {
  required_version = "~>1.8.0"

  required_providers {
    # https://github.com/hashicorp/terraform-provider-google
    google = {
      source  = "hashicorp/google"
      version = "~>5.41.0"
    }
  }
}
