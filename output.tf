output "container_definition" {
  value = var.enabled
}

output "volumes" {
  value = var.enabled ? local.volumes : []
}
