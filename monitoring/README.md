# Monitoring

| <h2> :warning: | <h6> É necessário providenciar a variável `project_id` e `region` via linha de comando ou diretamente no arquivo `variables.tf`. Além de definir o bucket para o state em `terraform.tf` |
 :-:|:-

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| helm | n/a |
| kubernetes | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) |
| [kubernetes_config_map](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) |
| [kubernetes_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | Unique project ID where all objects wiil be created | `string` | `"my-project"` | yes |
| region | Region where cluster will be deployed | `string` | `"us-east1"` | yes |
| loki-fluentbit | if true, it will setup fluentbit for loki | `bool` | `true` | no |
| loki-grafana | if true, it will setup grafana for loki | `bool` | `false` | no |
| loki-prometheus | if true, it will setup prometheus for loki | `bool` | `false` | no |
| loki-promtail | if true, it will setup promtail for loki | `bool` | `false` | no |

## Outputs

No output.
