locals {
  cluster_name = "${var.environment_name}-k8s-${var.region}"
}

module "gke" {
  # https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/tree/master/modules/beta-private-cluster-update-variant
  source                          = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster-update-variant"
  version                         = "32.0.0"
  project_id                      = var.project
  network_project_id              = var.host_project
  name                            = local.cluster_name
  region                          = var.region
  zones                           = [var.zone]
  network                         = google_compute_network.vpc.name
  subnetwork                      = google_compute_subnetwork.subnet.name
  ip_range_pods                   = "${var.project}-gke-pods"
  ip_range_services               = "${var.project}-gke-services"
  http_load_balancing             = true
  horizontal_pod_autoscaling      = true
  enable_vertical_pod_autoscaling = true
  network_policy                  = true
  remove_default_node_pool        = true
  release_channel                 = "UNSPECIFIED"
  create_service_account          = false # means gsa, NOT k8s_sa
  dns_cache                       = true

  deletion_protection = false # Use this only for testing purposess!

  maintenance_start_time = "2021-04-20T01:00:00Z"
  maintenance_end_time   = "2021-04-20T05:00:00Z"
  maintenance_recurrence = "FREQ=WEEKLY;BYDAY=MO,TH,SU"

  master_authorized_networks = var.master_authorized_networks

  node_pools = [
    {
      name               = "node-pool-1"
      machine_type       = "n2-standard-8"
      min_count          = 1
      max_count          = 2
      disk_size_gb       = 30
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      auto_repair        = true
      auto_upgrade       = true
      preemptible        = true
      initial_node_count = 1
      node_metadata      = "GKE_METADATA"
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  node_pools_tags = {
    all = [
      "${local.cluster_name}-${var.region}",
      "${local.cluster_name}-${var.region}-nodes"
    ]
  }

  depends_on = [
    google_compute_network.vpc,
    google_compute_subnetwork.subnet
  ]
}
