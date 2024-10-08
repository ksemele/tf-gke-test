locals {
  cluster_name = "${var.project}-gke"
}

resource "google_container_cluster" "primary" {
  name     = local.cluster_name
  location = var.zone

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network             = google_compute_network.vpc.name
  subnetwork          = google_compute_subnetwork.subnet.name
  deletion_protection = false # Use this only for testing purposess!
  depends_on = [
    google_compute_network.vpc,
    google_compute_subnetwork.subnet
  ]
}

# You can use only the default pool for your experiments, but in that confuguration
# you have more flexibility. Even Prometheus or Flux doesn't run in the default node.
# That's why I suppose to use a separate node pool.
resource "google_container_node_pool" "primary_nodes" {
  name       = google_container_cluster.primary.name
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project
    }

    preemptible  = true
    machine_type = "n2-standard-8"
    tags = [
      "${local.cluster_name}-${var.region}",
      "${local.cluster_name}-${var.region}-nodes"
    ]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  depends_on = [google_container_cluster.primary]
}
