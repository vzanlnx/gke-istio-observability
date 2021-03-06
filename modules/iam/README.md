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
| [google_project_iam_custom_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) |
| [google_project_iam_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) |
| [google_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| custom\_role\_permissions | Permissions to be added to a custom role | `list(string)` | n/a | yes |
| monitoring\_roles | Roles required to monitor account objects | `list(string)` | <pre>[<br>  "roles/logging.logWriter",<br>  "roles/monitoring.metricWriter",<br>  "roles/monitoring.viewer",<br>  "roles/stackdriver.resourceMetadata.writer"<br>]</pre> | no |
| project\_id | Unique project ID where all objects wiil be created | `string` | n/a | yes |
| service | Service name eg.: gke, elasticsearch | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| service\_account\_email | Service account email |
