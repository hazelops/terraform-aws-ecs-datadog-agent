output "container_definition" {
  value = var.enabled ? local.container_definition : {}
}

output "volumes" {
  value = var.enabled ? local.volumes : []
}
