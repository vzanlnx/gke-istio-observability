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
| loki-fluentbit | if true, it will setup fluentbit for loki | `bool` | `true` | no |
| loki-grafana | if true, it will setup grafana for loki | `bool` | `false` | no |
| loki-prometheus | if true, it will setup prometheus for loki | `bool` | `false` | no |
| loki-promtail | if true, it will setup promtail for loki | `bool` | `false` | no |
| project\_id | Unique project ID where all objects wiil be created | `string` | `"hash-306616"` | no |
| region | Region where VMs will be deployed | `string` | `"us-east1"` | no |

## Outputs

No output.
