terraform {
  backend "gcs" {
    bucket = "hash-state-env"
    prefix = "hash-k8s"
  }
}