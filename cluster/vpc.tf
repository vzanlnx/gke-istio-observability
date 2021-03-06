module "vpc" {
  source                  = "../modules/vpc"
  auto_create_subnetworks = false
  region                  = var.region
  ip_cidr_range           = "10.0.0.0/8"
  zone                    = data.google_compute_zones.available.names
}