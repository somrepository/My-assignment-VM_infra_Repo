rgsv_dev = {
  rg1 = {
    name       = "harshit-rg"
    location   = "centralindia"
    managed_by = "terraform"

  }
}

vnetworks_dev = {
  vnet1 = {
    vnet_name           = "harshit-vnet"
    location            = "centralindia"
    resource_group_name = "harshit-rg"
    address_space       = ["10.0.0.0/16"]

    tags = {
      env = "dev"
    }

    subnets = [
      {
        subnet_name      = "frontend-subnet"
        address_prefixes = ["10.0.0.0/24"]
      },
      {
        subnet_name      = "backend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      },

      {
        subnet_name      = "AzureBastionSubnet"
        address_prefixes = ["10.0.2.0/26"]
      }
    ]
  }
}


# pip_dev = {
#   pip1 = {
#     name                = "harshit-pip"
#     resource_group_name = "harshit-rg"
#     location            = "centralindia"
#     allocation_method   = "Static"
#   }
# }

nsg_dev = {
  nsg1 = {
    name                = "harshit-nsg"
    location            = "centralindia"
    resource_group_name = "harshit-rg"
  }
}


vm_dev = {
  vm1 = {
    nic_name                           = "harshit-vm"
    location                           = "centralindia"
    resource_group_name                = "harshit-rg"
    ip_configuration_name              = "internal"
    private_ip_address_allocation_name = "Dynamic"
    vm_name                            = "harshit-vm"
    size                               = "Standard_F2"
    caching                            = "ReadWrite"
    storage_account_type               = "Standard_LRS"
    subnet_name                        = "frontend-subnet"
    virtual_network_name               = "harshit-vnet"
    # pip_name             = "harshit-pip"
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

    kv_name         = "yuvi-secret"
    kv_secret1_name = "generation-y"
    kv_secret2_name = "genration-z"

  }




}

mssql_server_dev = {
  server1 = {
    name                         = "harshit-server"
    resource_group_name          = "harshit-rg"
    location                     = "centralindia"
    version                      = "12.0"
    administrator_login          = "dbadminuser"
    administrator_login_password = "Welcome@1234"
    minimum_tls_version          = "1.2"
    tags = {
      environment = "dev"
    }
  }
}

mssql_db_dev = {
  sql_db1 = {
    name         = "harshit-db"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_name = "VBS"
    tags = {
      environment = "dev"
    }
    server_name         = "harshit-server"
    resource_group_name = "harshit-rg"
  }
}

bastion_dev = {
  bash1 = {
    bation_host_name      = "jump_server_bash"
    location              = "centralindia"
    resource_group_name   = "harshit-rg"
    ip_configuration_name = "configuration"
    subnet_name           = "AzureBastionSubnet"
    virtual_network_name  = "harshit-vnet"
    bastion_pip_name      = "bastion-host-pipdata"
    resource_group_name2  = "yuvi"
  }
}


stgv_dev = {

  stg1 = {

    name                     = "harshitstg"
    resource_group_name      = "harshit-rg"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}
