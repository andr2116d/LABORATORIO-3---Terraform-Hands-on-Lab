variable "workspaces" {
  description = "Workspaces que existien"
  type        = list(string)
}

variable "puertos" {
  description = "Puertos externos según workspace"
  type = map(object({
    web = number
    api = number
    bd  = number
  }))
}
