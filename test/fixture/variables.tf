variable "networks" {
  type = object({
    suffix      = list(string)
    dns-hostnum = number
    cidr        = string
    subnets = list(object({
      name    = string
      newbits = number
      netnum  = number
    }))
  })
}