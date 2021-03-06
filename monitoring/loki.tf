resource "helm_release" "loki-bootstrap" {
  name      = "loki"
  namespace = "monitoring"
  chart     = "../charts/loki-stack"
  values    = [local.values]
  depends_on = [
    helm_release.prom-bootstrap,
    kubernetes_namespace.monitoring_ns,
  ]

  set {
    name  = "prometheus.alertmanager.persistentVolume.enabled"
    value = "false"
  }

  set {
    name  = "prometheus.server.persistentVolume.enabled"
    value = "false"
  }
}