data "google_compute_zones" "available" {
  region = var.region
}

data "google_client_config" "provider" {}
