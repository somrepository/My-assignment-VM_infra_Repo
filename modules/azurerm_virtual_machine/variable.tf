variable "vms" {
  type = map(object({
    nic_name                           = string
    location                           = string
    resource_group_name                = string
    ip_configuration_name              = string
    private_ip_address_allocation_name = string
    vm_name                            = string
    size                               = string
    caching                            = string
    storage_account_type               = string
    subnet_name                        = string
    virtual_network_name               = string
    # pip_name             = string
    publisher       = string
    offer           = string
    sku             = string
    version         = string
    kv_name         = string
    kv_secret1_name = string
    kv_secret2_name = string

  }))
}






