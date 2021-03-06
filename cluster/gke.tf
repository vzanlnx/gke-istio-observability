module "gke_account" {
  source                  = "../modules/iam"
  project_id              = var.project_id
  service                 = "gke"
  custom_role_permissions = ["compute.instances.get"]
}

module "gke" {
  source           = "../modules/gke"
  project_id       = var.project_id
  service          = "gke"
  ip_cidr_range    = "10.1.0.0/16"
  region           = var.region
  network          = module.vpc.vpc_network
  email            = module.gke_account.service_account_email
  gke_num_nodes    = 2
  oauth_scopes     = ""
  machine_type     = "e2-medium"
  tags             = ["env", "hash"]
  legacy_endpoints = true

} 