data "azurerm_subnet" "datasubnet" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_key_vault" "datakv" {
  for_each = var.vms

  name                = each.value.kv_name
  resource_group_name = "yuvi"

}

data "azurerm_key_vault_secret" "username" {
  for_each = var.vms

  name         = each.value.kv_secret1_name
  key_vault_id = data.azurerm_key_vault.datakv[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each = var.vms

  name         = each.value.kv_secret2_name
  key_vault_id = data.azurerm_key_vault.datakv[each.key].id
}



# data "azurerm_public_ip" "datapip" {
#   for_each = var.vms
#   name                = each.value.pip_name
#   resource_group_name = each.value.resource_group_name
# }
