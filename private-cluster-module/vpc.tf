# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_project_service" "service_networking" {
  service = "servicenetworking.googleapis.com"
  project = var.project
}

resource "google_compute_network" "vpc" {
  name                    = var.vpc_network
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.1.0.0/24"
  secondary_ip_range {
    range_name    = "${var.project}-gke-pods"
    ip_cidr_range = "10.2.0.0/19"
  }
  secondary_ip_range {
    range_name    = "${var.project}-gke-services"
    ip_cidr_range = "10.3.0.0/24"
  }
  private_ip_google_access = true
  depends_on               = [google_compute_network.vpc]
}
