resource "azurerm_resource_group" "rg-builder" {
  name     = "example-resources"
  location = "canadacentral"
}

module "networking-block" {
  source              = "../.."
  suffix              = var.networks.suffix
  location            = azurerm_resource_group.rg-builder.location
  resource_group_name = azurerm_resource_group.rg-builder.name
  dns-hostnum         = var.networks.dns-hostnum
  cidr                = var.networks.cidr
  subnets             = var.networks.subnets
}
