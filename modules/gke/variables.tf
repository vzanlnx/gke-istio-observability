#General

variable "project_id" {
  type        = string
  description = "Unique project ID where all objects wiil be created"
}

variable "ip_cidr_range" {
  type        = string
  description = "CIDR that defines internal IPs ranges. Only IPv4 is supported"
}

variable "region" {
  type        = string
  description = "Region where VMs will be deployed"
}

variable "network" {
  type        = string
  description = "Network name"
}

variable "service" {
  type        = string
  description = "Service name eg.: gke, elasticsearch"
}

variable "machine_type" {
  type        = string
  description = "Machine size to be deployed"
}

variable "gke_num_nodes" {
  type        = string
  description = "Desired number of GKE nodes"
}

variable "email" {
  type        = string
  description = "Account email"
}

variable "tags" {
  type        = list(string)
  description = "Tags"
}

variable "legacy_endpoints" {
  type        = string
  description = "Defines if legacy endpoints should be used"
  default     = false
}

variable "oauth_scopes" {
  type        = string
  description = "Oauth scopes"
  default     = false
}
