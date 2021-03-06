## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| gke | ../modules/gke |  |
| gke_account | ../modules/iam |  |
| vpc | ../modules/vpc |  |

## Resources

| Name |
|------|
| [google_client_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) |
| [google_compute_zones](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | Unique project ID where all objects wiil be created | `string` | `"hash-306616"` | no |
| region | Region where VMs will be deployed | `string` | `"us-east1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_endpoint | Cluster endpoint |
| cluster\_name | Cluster name |
| gcloud\_credentials\_command | copy and paste this command to access de cluster via gcloud auth |
| local\_config\_context | context to be used in kube\_config |
