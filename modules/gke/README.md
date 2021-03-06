## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |
| google-beta | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [google-beta_google_container_cluster](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_cluster) |
| [google_compute_subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) |
| [google_container_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| email | Account email | `string` | n/a | yes |
| gke\_num\_nodes | Desired number of GKE nodes | `string` | n/a | yes |
| ip\_cidr\_range | CIDR that defines internal IPs ranges. Only IPv4 is supported | `string` | n/a | yes |
| legacy\_endpoints | Defines if legacy endpoints should be used | `string` | `false` | no |
| machine\_type | Machine size to be deployed | `string` | n/a | yes |
| network | Network name | `string` | n/a | yes |
| oauth\_scopes | Oauth scopes | `string` | `false` | no |
| project\_id | Unique project ID where all objects wiil be created | `string` | n/a | yes |
| region | Region where VMs will be deployed | `string` | n/a | yes |
| service | Service name eg.: gke, elasticsearch | `string` | n/a | yes |
| tags | Tags | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_endpoint | Cluster endpoint |
| cluster\_name | Cluster endpoint |
