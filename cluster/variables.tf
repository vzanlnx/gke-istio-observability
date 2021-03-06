#General

variable "project_id" {
  type        = string
  description = "Unique project ID where all objects wiil be created"
  default     = "hash-306616"
}

variable "region" {
  type        = string
  description = "Region where VMs will be deployed"
  default     = "us-east1"
}
