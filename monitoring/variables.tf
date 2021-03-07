#General

variable "project_id" {
  type        = string
  description = "Unique project ID where all objects wiil be created"
  default     = "my-project"
}

variable "region" {
  type        = string
  description = "Region where VMs will be deployed"
  default     = "us-east1"
}


# variables for loki-stack

variable "loki-promtail" {
  type        = bool
  description = "if true, it will setup promtail for loki"
  default     = false
}

variable "loki-fluentbit" {
  type        = bool
  description = "if true, it will setup fluentbit for loki"
  default     = true
}

variable "loki-grafana" {
  type        = bool
  description = "if true, it will setup grafana for loki"
  default     = false
}

variable "loki-prometheus" {
  type        = bool
  description = "if true, it will setup prometheus for loki"
  default     = false
}
