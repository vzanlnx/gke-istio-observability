resource "kubernetes_namespace" "monitoring_ns" {
  metadata {
    name = "monitoring"
  }
}

resource "helm_release" "prom-bootstrap" {
  name       = "po"
  namespace  = "monitoring"
  chart      = "../charts/kube-prometheus-stack"
  values     = [file("../charts/kube-prometheus-stack/values.yaml")]
  depends_on = [kubernetes_namespace.monitoring_ns]
}
