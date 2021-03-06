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
| [google_compute_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto\_create\_subnetworks | Defines if VPC will auto create sunets | `bool` | `"false"` | no |
| ip\_cidr\_range | CIDR that defines internal IPs ranges. Only IPv4 is supported | `string` | `"10.1.0.0/16"` | no |
| project\_id | Unique project ID where all objects wiil be created | `string` | `"observability-labs"` | no |
| region | Region where VMs will be deployed | `string` | `"us-east1"` | no |
| zone | Availability zones for the configured region | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_network | VPC Network |
