output "virtual-network-name" {
  value = module.networking-block.virtual-network-name
}

output "subnet-name" {
  value = module.networking-block.subnet-name[1]
}

output "vnet-cidr" {
  value = module.networking-block.vnet-cidr
}

output "snet-cidr" {
  value = module.networking-block.subnet-cidr[2]
}

output "dns-server" {
  value = module.networking-block.dns-server[0]
}