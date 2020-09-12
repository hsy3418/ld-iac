resource "launchdarkly_project" "project" {
  key  = var.project_name
  name = var.project_name
}

resource "launchdarkly_environment" "staging" {
  name  = "Staging"
  key   = "staging"
  color = "ff00ff"
  tags  = ["staging"]

  project_key = launchdarkly_project.project.key
  lifecycle {
    ignore_changes = [
      color,
    ]
  }
}

resource "launchdarkly_environment" "sit" {
  name  = "SIT"
  key   = "sit"
  color = "57f9da"
  tags  = ["sit"]

  project_key = launchdarkly_project.project.key
  lifecycle {
    ignore_changes = [
      color,
    ]
  }
}

resource "launchdarkly_environment" "pnv" {
  name  = "PnV"
  key   = "pnv"
  color = "ffbf00"
  tags  = ["pnv"]

  project_key = launchdarkly_project.project.key
  lifecycle {
    ignore_changes = [
      color,
    ]
  }
}

resource "launchdarkly_environment" "pre_production" {
  name  = "Pre-Production"
  key   = "pre-production"
  color = "08afda"
  tags  = ["pre-production"]

  project_key = launchdarkly_project.project.key
  lifecycle {
    ignore_changes = [
      color,
    ]
  }
}

resource "launchdarkly_custom_role" "write" {
  key         = "${var.project_name}-write"
  name        = "${var.project_name}-write"
  description = "Write Access to ${var.project_name} project"

  policy_statements {
    effect        = "deny"
    not_resources = ["proj/${var.project_name}"]
    actions = [
      "updateTags",
      "updateIncludeInSnippetByDefault",
      "viewProject"
    ]
  }
  policy_statements {
    effect    = "allow"
    resources = ["proj/${var.project_name}:env/*:flag/*"]
    actions   = ["*"]
  }
}

resource "launchdarkly_custom_role" "read" {
  key         = "${var.project_name}-read"
  name        = "${var.project_name}-read"
  description = "Read Access to ${var.project_name} project"

  policy_statements {
    effect        = "deny"
    not_resources = ["proj/${var.project_name}"]
    actions = [
      "viewProject"
    ]
  }
}
