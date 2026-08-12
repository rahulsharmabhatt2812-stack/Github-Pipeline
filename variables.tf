variable "rgs" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "Map of resource groups to create"
}
