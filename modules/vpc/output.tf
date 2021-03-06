output "vpc_network" {
  value       = google_compute_network.vpc.id
  description = "VPC Network"
}
