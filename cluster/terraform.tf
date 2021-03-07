terraform {
  backend "gcs" {
    bucket = "my-bucket"
    prefix = "demo-hash-k8s"
  }
}
