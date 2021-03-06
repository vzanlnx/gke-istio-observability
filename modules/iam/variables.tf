#General

variable "project_id" {
  type        = string
  description = "Unique project ID where all objects wiil be created"
}

variable "service" {
  type        = string
  description = "Service name eg.: gke, elasticsearch"
}

variable "custom_role_permissions" {
  type        = list(string)
  description = "Permissions to be added to a custom role"
}

variable "monitoring_roles" {
  type        = list(string)
  description = "Roles required to monitor account objects"
  default     = ["roles/logging.logWriter", "roles/monitoring.metricWriter", "roles/monitoring.viewer", "roles/stackdriver.resourceMetadata.writer"]
}