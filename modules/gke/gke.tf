resource "google_compute_subnetwork" "gke_network" {
  name          = "${var.project_id}-${var.service}-${terraform.workspace}-subnet"
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = var.network
}

resource "google_container_cluster" "primary" {
  provider = google-beta
  name     = "${var.project_id}-${terraform.workspace}-k8s"
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.network
  subnetwork = google_compute_subnetwork.gke_network.id
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/16"
    services_ipv4_cidr_block = "/22"
  }
  network_policy {
    enabled = true
  }
  addons_config {
    network_policy_config {
      disabled = false
    }
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-np"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    service_account = var.email

    labels = {
      env = terraform.workspace

    }

    machine_type = var.machine_type
    tags         = var.tags
    metadata = {
      disable-legacy-endpoints = var.legacy_endpoints
    }

  }
}
