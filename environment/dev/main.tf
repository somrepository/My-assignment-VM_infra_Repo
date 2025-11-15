module "rgm" {
  source = "../../modules/azurerm_rescource_group"
  rgsv   = var.rgsv_dev
}

module "vnetworkm" {
  depends_on = [module.rgm]
  source     = "../../modules/azurerm_networking"
  vnetworks  = var.vnetworks_dev
}

module "stgvm" {
  depends_on = [module.rgm]
  source     = "../../modules/azurerm_storage_account"
  stgv       = var.stgv_dev

}

# module "pipmod" {
#   depends_on = [module.rgmod]
#   source     = "../../modules/azurerm_public_ip"
#   pip        = var.pip_dev
# }

module "nsgm" {
  depends_on = [module.rgm]
  source     = "../../modules/azurerm_nsg"
  nsg        = var.nsg_dev
}

module "vmm" {
  depends_on = [module.vnetworkm]
  source     = "../../modules/azurerm_virtual_machine"
  vms        = var.vm_dev
  }

module "mssqlserverm" {
  depends_on   = [module.rgm]
  source       = "../../modules/azurerm_mssql_server"
  mssql_server = var.mssql_server_dev
}

module "mssqldbm" {
  depends_on = [module.rgm, module.mssqlserverm]
  source     = "../../modules/azurerm_mssql_database"
  mssql_db   = var.mssql_db_dev
}

module "baistianm" {
  depends_on = [module.rgm, module.vnetworkm]
  source     = "../../modules/azurerm_bastion"
  jump-host  = var.bastion_dev

}



# # module "keyvault" {
# #     source = "../../modules/azurerm_keyvault"
# #     kv = var.kv_dev
# # }

# # module "keyvault_secret" {
# #     source = "../../modules/azurerm_keyvault_secrets"
# #     kv_secret = var.kv_secret_dev
# # }
