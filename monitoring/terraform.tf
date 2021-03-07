terraform {
  backend "gcs" {
    bucket = "my-bucket"
    prefix = "demo-obs-k8s"
  }
}
