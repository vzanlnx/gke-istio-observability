terraform {
  backend "gcs" {
    bucket = "hash-state-env"
    prefix = "obs-k8s"
  }
}