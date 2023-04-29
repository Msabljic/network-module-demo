module "naming" {
  source                 = "Azure/naming/azurerm"
  version                = "0.2.0"
  suffix                 = var.suffix
  unique-include-numbers = var.unique-number
  unique-length          = var.unique-length
}

resource "azurerm_virtual_network" "vnet-creation-block" {
  name                = var.vnet-name != "" ? var.vnet-name : module.naming.virtual_network.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.cidr]
  dns_servers         = [cidrhost(var.cidr, var.dns-hostnum)]

  dynamic "subnet" {
    for_each = { for s in var.subnets : "${s.newbits}-${s.netnum}" => s }
    content {
      name           = subnet.value.name != "" ? subnet.value.name : module.naming.subnet.name
      address_prefix = cidrsubnet(var.cidr, subnet.value.newbits, subnet.value.netnum)
    }
  }

  tags = var.tags
}
