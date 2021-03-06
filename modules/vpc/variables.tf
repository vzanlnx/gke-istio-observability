#General

variable "project_id" {
  type        = string
  description = "Unique project ID where all objects wiil be created"
  default     = "observability-labs"
}

variable "region" {
  type        = string
  description = "Region where VMs will be deployed"
  default     = "us-east1"
}

variable "zone" {
  type        = list(string)
  description = "Availability zones for the configured region"
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "Defines if VPC will auto create sunets"
  default     = "false"
}

variable "ip_cidr_range" {
  type        = string
  description = "CIDR that defines internal IPs ranges. Only IPv4 is supported"
  default     = "10.1.0.0/16"
}
