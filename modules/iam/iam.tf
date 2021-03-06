resource "google_service_account" "service_account" {
  project      = var.project_id
  account_id   = "${var.service}-account"
  display_name = "Terraform-managed ${var.service} Account"
}

resource "google_project_iam_custom_role" "custom-role" {
  role_id     = "${var.service}Role"
  title       = "Role for ${var.service}"
  permissions = var.custom_role_permissions
}

resource "google_project_iam_member" "iam_membership" {
  project = var.project_id
  role    = google_project_iam_custom_role.custom-role.id
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "monitoring_roles" {
  for_each = toset(var.monitoring_roles)
  project  = var.project_id
  role     = each.key
  member   = "serviceAccount:${google_service_account.service_account.email}"
}