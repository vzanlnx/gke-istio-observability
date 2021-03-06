resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-${terraform.workspace}-vpc"
  auto_create_subnetworks = var.auto_create_subnetworks
}
