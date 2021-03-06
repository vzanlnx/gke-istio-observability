output "cluster_name" {
  description = "Cluster name"
  value       = module.gke.cluster_name
}

output "cluster_endpoint" {
  description = "Cluster endpoint"
  value       = module.gke.cluster_endpoint
}

output "local_config_context" {
  description = "context to be used in kube_config"
  value       = "gke_${var.project_id}_${var.region}_${module.gke.cluster_name}"
}

output "gcloud_credentials_command" {
  description = "copy and paste this command to access de cluster via gcloud auth"
  value       = "gcloud container clusters get-credentials ${module.gke.cluster_name} --region ${var.region} --project ${var.project_id}"
}