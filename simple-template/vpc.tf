# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_project_service" "service_networking" {
  service = "servicenetworking.googleapis.com"
  project = var.project
}

resource "google_compute_network" "vpc" {
  name                    = "${var.project}-vpc"
  auto_create_subnetworks = "false"
  depends_on              = [google_project_service.service_networking]
}

resource "google_compute_subnetwork" "subnet" {
  name                     = "${var.project}-subnet"
  region                   = var.region
  network                  = google_compute_network.vpc.name
  ip_cidr_range            = "10.0.0.0/14"
  private_ip_google_access = true
  depends_on               = [google_compute_network.vpc]
}
