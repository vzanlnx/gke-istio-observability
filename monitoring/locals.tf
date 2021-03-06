locals {
  values = templatefile("../charts/loki-stack/values.yaml", {

    loki-promtail   = var.loki-promtail
    loki-fluentbit  = var.loki-fluentbit
    loki-grafana    = var.loki-grafana
    loki-prometheus = var.loki-prometheus

  })
}
