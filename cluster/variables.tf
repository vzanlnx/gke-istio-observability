#General

variable "project_id" {
  type        = string
  description = "Unique project ID where all objects wil be created"
  default     = "my-project"
}

variable "region" {
  type        = string
  description = "Region where cluster will be deployed"
  default     = "us-east1"
}

