resource "kubernetes_config_map" "grafana-dashboards-istio" {
  metadata {
    name      = "grafana-dashboard-istio"
    namespace = "monitoring"

    labels = {
      grafana_dashboard = 1
    }

  }

  data = {
    "istio-mesh-dashboard.json"          = file("./istio-dashboards/istio-mesh-dashboard.json")
    "istio-performance-dashboard.json"   = file("./istio-dashboards/istio-performance-dashboard.json")
    "istio-service-dashboard.json"       = file("./istio-dashboards/istio-service-dashboard.json")
    "istio-workload-dashboard.json"      = file("./istio-dashboards/istio-workload-dashboard.json")
    "istio-control-plane-dashboard.json" = file("./istio-dashboards/istio-control-plane-dashboard.json")
  }
  depends_on = [
    helm_release.prom-bootstrap,
    helm_release.loki-bootstrap,
    kubernetes_namespace.monitoring_ns,
  ]
}