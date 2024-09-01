data "google_client_config" "default" {}

provider "google" {
  project = var.project
  region  = var.region
}
