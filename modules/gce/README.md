## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [google_compute_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) |
| [google_compute_subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| email | n/a | `string` | n/a | yes |
| image | Image used to create VMs from | `string` | `"centos/centos-7"` | no |
| ip\_cidr\_range | CIDR that defines internal IPs ranges. Only IPv4 is supported | `string` | n/a | yes |
| machine\_type | Machine size to be deployed | `string` | n/a | yes |
| network | Network | `string` | n/a | yes |
| project\_id | Unique project ID where all objects wiil be created | `string` | `"observability-labs"` | no |
| region | Region where VMs will be deployed | `string` | n/a | yes |
| scopes | API permissions scope | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| service | Service name eg.: gke, elasticsearch | `string` | n/a | yes |
| vm\_count | Machine size to be deployed | `number` | n/a | yes |
| zone | List of zones that will be available | `list(string)` | n/a | yes |

## Outputs

No output.
