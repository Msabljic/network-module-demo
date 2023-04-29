output "virtual-network-name" {
  value = resource.azurerm_virtual_network.vnet-creation-block.name
}

output "subnet-name" {
  value = resource.azurerm_virtual_network.vnet-creation-block.subnet.*.name
}

output "vnet-cidr" {
  value = var.cidr
}

output "subnet-cidr" {
  value = resource.azurerm_virtual_network.vnet-creation-block.subnet.*.address_prefix
}

output "dns-server" {
  value = [cidrhost(var.cidr, var.dns-hostnum)]
}