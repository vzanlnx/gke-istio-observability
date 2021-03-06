output "cluster_endpoint" {
  description = "Cluster endpoint"
  value       = google_container_cluster.primary.endpoint
}

output "cluster_name" {
  description = "Cluster endpoint"
  value       = google_container_cluster.primary.name
}

