resource "google_compute_subnetwork" "gke_network" {
  name          = "${var.project_id}-${var.service}-${terraform.workspace}-subnet"
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = var.network
}

resource "google_compute_instance" "vm_instance" {
  count        = var.vm_count
  name         = "${var.service}-instance${count.index}"
  machine_type = var.machine_type
  zone         = var.zone[count.index % length(var.zone)]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.gke_network.id
  }

  service_account {
    email  = var.email
    scopes = var.scopes

  }

}