output "project_key" {
  value = launchdarkly_project.project.key
}

# output "prod_key" {
#   value = launchdarkly_environment.production.key
# }

# output "pre_prod_id" {
#   value = launchdarkly_environment.pre_production.id
# }

output "pnv_id" {
  value = launchdarkly_environment.pnv.id
}

output "sit_id" {
  value = launchdarkly_environment.sit.id
}

# output "stag_id" {
#   value = launchdarkly_environment.staging.id
# }

output "pnv_key" {
  value = launchdarkly_environment.pnv.key
}
