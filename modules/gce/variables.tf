#General

variable "project_id" {
  type        = string
  description = "Unique project ID where all objects wiil be created"
  default     = "observability-labs"
}

variable "region" {
  type        = string
  description = "Region where VMs will be deployed"
}

variable "service" {
  type        = string
  description = "Service name eg.: gke, elasticsearch"
}

variable "zone" {
  type        = list(string)
  description = "List of zones that will be available"
}

#Network
variable "network" {
  type = string
}

variable "ip_cidr_range" {
  type        = string
  description = "CIDR that defines internal IPs ranges. Only IPv4 is supported"
}

#Compute Engine

variable "image" {
  type        = string
  description = "Image used to create VMs from"
  default     = "centos/centos-7"
}

variable "machine_type" {
  type        = string
  description = "Machine size to be deployed"
}

variable "scopes" {
  type        = list(string)
  description = "API permissions scope"
  default     = [""]
}

variable "email" {
  type = string
}

variable "vm_count" {
  type        = number
  description = "Machine size to be deployed"
}