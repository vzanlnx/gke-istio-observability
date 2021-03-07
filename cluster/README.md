# Cluster Provisioning


| <h2> :warning: | <h6> É necessário providenciar a variável `project_id` e `region` via linha de comando ou diretamente no arquivo `variables.tf`. Além de definir o bucket para o state em `terraform.tf` |
 :-:|:-


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
| project\_id | Unique project ID where all objects wil be created | `string` | `"my-project"` | yes |
| region | Region where cluster will be deployed | `string` | `"us-east1"` | yes |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_endpoint | Cluster endpoint |
| cluster\_name | Cluster name |
| gcloud\_credentials\_command | copy and paste this command to access de cluster via gcloud auth |
| local\_config\_context | context to be used in kube\_config |
