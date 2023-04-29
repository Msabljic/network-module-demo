variable "suffix" {
  type        = list(string)
  description = "Description: It is recommended that you specify a suffix for consistency. please use only lowercase characters when possible"
  default     = ["test", "code"]
}

variable "unique-number" {
  type        = bool
  description = "Description: If you want to include numbers in the unique generation"
  default     = true
}

variable "unique-length" {
  type        = number
  description = "Description: Max length of the uniqueness suffix to be added"
  default     = 6
}

variable "vnet-name" {
  type        = string
  description = "Name of virtual network to create"
  default     = ""
}

variable "location" {
  type        = string
  description = "Physical location of resources"
  default     = "canadacentral"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
  default     = "test"
}

variable "dns-hostnum" {
  type        = number
  description = "Whole number for binary within the cidr range"
  default     = 25

}

variable "cidr" {
  type        = string
  description = "CIDR block which subnets are consumed from"
  default     = "10.0.0.0/24"
}

variable "subnets" {
  type = list(object({
    name    = string
    newbits = number
    netnum  = number
  }))
  default = [{
    netnum  = 4
    newbits = 4
    name    = ""
  }]
  description = "Values which will control creation of subnets within the vnet. Reference terraform cidr variable docs & networking material"
}

variable "tags" {
  type = map
  default = { env = "dev", 
              cloud = "azure",
              resource = "test" 
            }
}