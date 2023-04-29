<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.53.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | 0.2.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network.vnet-creation-block](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | CIDR block which subnets are consumed from | `string` | `"10.0.0.0/24"` | no |
| <a name="input_dns-hostnum"></a> [dns-hostnum](#input\_dns-hostnum) | Whole number for binary within the cidr range | `number` | `25` | no |
| <a name="input_location"></a> [location](#input\_location) | Physical location of resources | `string` | `"canadacentral"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | `"test"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Values which will control creation of subnets within the vnet. Reference terraform cidr variable docs & networking material | <pre>list(object({<br>    name    = string<br>    newbits = number<br>    netnum  = number<br>  }))</pre> | <pre>[<br>  {<br>    "name": "",<br>    "netnum": 4,<br>    "newbits": 4<br>  }<br>]</pre> | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | Description: It is recommended that you specify a suffix for consistency. please use only lowercase characters when possible | `list(string)` | <pre>[<br>  "test",<br>  "code"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | <pre>{<br>  "cloud": "azure",<br>  "env": "dev",<br>  "resource": "test"<br>}</pre> | no |
| <a name="input_unique-length"></a> [unique-length](#input\_unique-length) | Description: Max length of the uniqueness suffix to be added | `number` | `6` | no |
| <a name="input_unique-number"></a> [unique-number](#input\_unique-number) | Description: If you want to include numbers in the unique generation | `bool` | `true` | no |
| <a name="input_vnet-name"></a> [vnet-name](#input\_vnet-name) | Name of virtual network to create | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns-server"></a> [dns-server](#output\_dns-server) | n/a |
| <a name="output_subnet-cidr"></a> [subnet-cidr](#output\_subnet-cidr) | n/a |
| <a name="output_subnet-name"></a> [subnet-name](#output\_subnet-name) | n/a |
| <a name="output_virtual-network-name"></a> [virtual-network-name](#output\_virtual-network-name) | n/a |
| <a name="output_vnet-cidr"></a> [vnet-cidr](#output\_vnet-cidr) | n/a |
<!-- END_TF_DOCS -->