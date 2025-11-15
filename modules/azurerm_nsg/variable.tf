variable "nsg" {
  type = map(object({
    name                = string
    location            = optional(string)
    resource_group_name = optional(string)
    tags                = optional(map(string))
    security_rule = optional(list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
      description                = optional(string)
    })))
  }))
}
