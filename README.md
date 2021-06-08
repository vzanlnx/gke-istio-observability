# gke-istio-observability

#### Tools I use in this demo:

- [GKE](https://cloud.google.com/kubernetes-engine?hl=pt-br)
- [Istio](https://istio.io/)
- [Jaeger](https://www.jaegertracing.io/)
- [Kiali](https://kiali.io/)
- [Grafana](https://grafana.com/oss/grafana/)
- [Loki](https://grafana.com/oss/loki/)
- [Prometheus Operator](https://github.com/prometheus-operator/prometheus-operator)

Also, this demo was made using the [Istio Bookinfo app example](https://istio-releases.github.io/v0.1/docs/samples/bookinfo.html).

---
## Summary:

  - [1. Cluster Install](#1-instalação-do-cluster)
  - [2. Observability Stack](#2-configuração-da-stack-de-observability)
  - [3. Setup Istio (with Jaeger and Kiali)](#3-configuração-do-istio-com-jaeger-e-kiali)
  - [4. Bookapp Install](#4-instalação-da-aplicação-bookapp)
  - [5. Accessing](#5-acesso)
  - [6. Comments and Improvements](#6-comentários-e-melhorias)

---

  | <h2> :information_source: | <h6> All terraform code have your own state file stored in a private bucket, so you may want to declare an existent bucket in `terraform.tf` in order to run that code. |
   :-:|:-

  ## 1. Cluster Install

  Inside [./cluster](./cluster) directory, there is a terraform code to provisioning a GKE cluster in and all dependencies related.
  
  Some resources are named acording to workspace name from terraform.

| <h2> :warning: | <h6> It's necessary to provide `project_id` and `region` variables through commandline or using the `variables.tf` file. And don't forget to declare where your state file will be stored in `terraform.tf`. |
 :-:|:-

  - To create the cluster:

  ```shell
  terraform init
  terraform workspace new dev
  terraform apply
  ```

  - after created, use the suggested command line from ouput `gcloud_credentials_command` to update your kube_config configuration and be able to authenticate in your cluster.


---

  ## 2. Observability Stack
  
 
  Using the [./monitoring](./monitoring) directory, we see the terraform code which is responsible to configure the following tools: Grafana, Loki, Prometheus Operator and some integrations through local helm charts
  
  - The `kube-prometheus-stack` was configured directly using the `values.yaml` file;
  - The `loki-stack`, was configured through a template file in terraform, in order to show the possibility of manage all configuration parameters from external variables;
  - Also, there is a config_map resource which automate grafana dashboards, an interesting way of controlling views in grafana as a code. In this case, we are configuring some istio dashboards.

| <h2> :warning: | <h6> It's necessary to provide `project_id` and `region` variables through commandline or using the `variables.tf` file. And don't forget to declare where your state file will be stored in `terraform.tf`. |
 :-:|:-

  - to setup the obs stack:

  ```shell
  terraform init
  terraform apply
  ```

 ## 3. Setup Istio (with Jaeger and Kiali)

  It's necessary to install the command line from [Istio 1.9](https://istio.io/latest/docs/setup/getting-started/) in order to setup te service mesh structure.
  
 - The namespaces managed by Istio, should have the following labels:

  ```shell
  kubectl label namespace default istio-injection=enabled
  ```

 - Installing through `istioctl`: (this is just a demo, so we can use the demo profile ")

 ```shell
 istioctl install --set profile=demo -y
 ```

 - Configuring the Istio monitoring stack using `kubectl` in [./istio-monitoring](./istio-monitoring):
  
```shell
kubectl apply -f istio-monitoring/
```

---

 ## 4. Bookapp Install
  
  
The app manifests are available in [./bookapp](./bookapp) directory. The images were locally built and published on GCR.

```shell
# use -n default parameter in order to deploy in the correct namespace
  
kubectl apply -f bookapp/ -n default 
```
In this moment, the app should be available through `external ip` from `istio-ingressgateway`.

---

## 5. Accessing

It's possible to access the observability tools using `port-forward` or exposing it through loadbalancer too.

```shell
kubectl port-forward svc/po-grafana 3000:80 -n monitoring
kubectl port-forward svc/po-prometheus 9090:9090 -n monitoring
kubectl port-forward svc/kiali  20001:20001 -n istio-system
```

From Grafana is possible to access some dashboards with kubernetes and istio metrics, also is possible consult all logs from app and infrastructure using Loki datasource.
  
From Kiali, is possible to check all application tracing.

 | <h2> :information_source: | <h6> The default Grafana credentials are: `admin/prom-operator` |
  :-:|:-
---

## 6. Comments and Improvements

- The Prometheus Operator is configured to obtain metrics from istio using federation, using some specifics scrapping rules. In the future, It can be better to scrape metrics directly from istio pods instead use federate and havingone more prometheus server.

- No data persistency was used in this demo. In order to grant more stability and scalability, can be interesting to setup a good external data persistency method. Ex: we can use bigtable and buckets to persist data from Prometheus and Loki, beyond the persistent volumes already used by GKE storage layer.
