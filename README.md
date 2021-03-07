# gke-istio-observability

#### Ferramentas utilizadas:

- [GKE]([bookapp/bookapp.yaml](https://cloud.google.com/kubernetes-engine?hl=pt-br))
- [Istio](https://istio.io/)
- [Jaeger](https://www.jaegertracing.io/)
- [Kiali](https://kiali.io/)
- [Grafana](https://grafana.com/oss/grafana/)
- [Loki](https://grafana.com/oss/loki/)
- [Prometheus Operator](https://github.com/prometheus-operator/prometheus-operator)

---
## Sumário:

  - [1. Instalação do Cluster](#1-instalação-do-cluster)
  - [2. Configuraçao da Stack de Observability](#2-configuraçao-da-stack-de-observability)
  - [3. Configuraçao do Istio (com Jaeger e Kiali)](#3-configuraçao-do-istio-com-jaeger-e-kiali)
  - [4. Instalação da aplicação bookapp](#4-instalação-da-aplicação-bookapp)
  - [5. Acesso](#5-acesso)
  - [6. Comentários e Melhorias](#6-comentários-e-melhorias)

---

  | <h2> :information_source: | <h6> Todos os códigos que estão em terraform, têm seu arquivo de estado armazenado em um bucket privado, o uso apropriado exige que seja declarado um bucket acessível pela conta autenticadano arquivo `terraform.tf`. |
   :-:|:-

  ## 1. Instalação do Cluster

  No diretório [./cluster](./cluster) há um código em terraform responsável pelo provisionamento do cluster no Google Cloud.

  Além do cluster GKE, o codigo também provisiona através dos modulos, as dependências necessárias para o seu funcionamento correto.

  Alguns recursos são nomeados de acordo com o `workspace` do terraform.


| <h2> :warning: | <h6> É necessário providenciar a variável `project_id` e `region` via linha de comando ou diretamente no arquivo `variables.tf`. Além de definir o bucket para o state em `terraform.tf` |
 :-:|:-

  - Para provisionar o cluster:

  ```shell
  terraform init
  terraform workspace new dev
  terraform apply
  ```

  - Após provisionado, utilize o comando citado no output `gcloud_credentials_command` para atualizar as configurações do kube_config.


---

  ## 2. Configuraçao da Stack de Observability

 No diretório [./monitoring](./monitoring) está o código terraform que provisiona o Grafana, Loki, Prometheus Operator e suas integrações através de charts locais.

 - o chart `kube-prometheus-stack` teve o arquivo `values.yaml` diretamente customizado.
 - Já no chart `loki-stack`, o arquivo `values.yaml` foi configurado através de template file, apenas como fim de mostrar a possibilidade de gerenciar a configuração de todos os parâmetros de um chart através de variáveis.
 - Há também um resource de config_map que automatiza o deploy de novas dashboards no grafana, uma forma interessante de ter o controle sobre a organização dos views no grafana. Nessa caso são configurados os dashboards referente ao Istio

| <h2> :warning: | <h6> É necessário providenciar a variável `project_id` e `region` via linha de comando ou diretamente no arquivo `variables.tf`. Além de definir o bucket para o state em `terraform.tf` |
 :-:|:-

  - Para provisionar a stack:

  ```shell
  terraform init
  terraform apply
  ```

 ## 3. Configuraçao do Istio (com Jaeger e Kiali)

  É necessário ter o commandline do [Istio 1.9](https://istio.io/latest/docs/setup/getting-started/) instalado na máquina para a configuração do service mesh.

 - Os namespaces que vão ter o gerenciamento do Istio, devem receber a label abaixo:

  ```shell
  kubectl label namespace default istio-injection=enabled
  ```

 - Instalação do serviço através do `istioctl`

 ```shell
 istioctl install --set profile=demo -y
 ```

 - Configuração da stack de monitoring do Istio via `kubectl` em [./istio-monitoring](./istio-monitoring):
  
```shell
kubectl apply -f istio-monitoring/
```

---

 ## 4. Instalação da aplicação bookapp

 Os manifestos da aplicação estão disponíveis em [./bookapp](./bookapp). As imagens foram buildadas localmente e publicadas no container registry do gcp em um repositório público.

  | <h1> :information_source: | <h6> Não foram realizadas alterações nos arquivos `Dockerfile` fornecidos. |
  :-:|:-

```shell
# necessário apontar a opcão -n default para garantir o deploy no namespace correto.

kubectl apply -f bookapp/ -n default 
```
Nesse momento a applicação já deve estar funcional e acessível através do `external ip` do `istio-ingressgateway`

---

## 5. Acesso

É possível acessar as ferramentas de observability com port-forward ou realizando o expose via loadbalancer também.

```shell
kubectl port-forward svc/po-grafana 3000:80 -n monitoring
kubectl port-forward svc/po-prometheus 9090:9090 -n monitoring
kubectl port-forward svc/kiali  20001:20001 -n istio-system
```

Através do Grafana é possível acessar os dashboards do Kubernetes e Istio com Prometheus como datasource, além de consultar Logs coletados pelo Loki como datasource também.

Através do Kiali, é possível realizar o tracing das aplicações além de coletar outras métricas e algumas funções de operação dentro dos namespaces com a label do istio.

 | <h2> :information_source: | <h6> As credenciais do Grafana são: `admin/prom-operator` |
  :-:|:-
---

## 6. Comentários e Melhorias

- O Prometheus Operator está cofigurado para obter as métricas do prometheus do Istio via federação, com regras específicas de scrapping e rules. Futuramente, poderia ser melhor configurar o scrape direto dos pods e eliminar a necessidade do federate.

- O Loki está configurado com seus próprios nodeports (builtin) de fluentbit monitorando os logs sendo que o cluster GKE já possui nodeports de fluentbit também. Talvez subir o cluster e o loki sem os nodeports e configurar separadamente o coletor de logs seja uma opção mais eficiente e de menor custo.

- Não foi utilizado persistência de dados nessa demonstração. Para garantir maior estabilidade e escalabilidade é interessante configurar persistência de dados externa. No caso do Prometheus e Loki, ambos podem fazer uso do bigtable e buckets, além dos persistent volumes que são integrados com o layer de storage do google.