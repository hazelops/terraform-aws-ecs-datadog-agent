output "container_definition" {
  value = local.container_definition
}

output "volumes" {
  value = var.enabled ? local.volumes : []
}
