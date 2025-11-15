output "rg_name" {
  value = { for k, v in azurerm_resource_group.rg :k => v.name }
}

