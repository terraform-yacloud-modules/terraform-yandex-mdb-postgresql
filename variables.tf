variable "name" {
  description = "Name of the PostgreSQL cluster"
  type        = string
}

variable "environment" {
  description = "Deployment environment of the PostgreSQL cluster"
  type        = string
}

variable "network_id" {
  description = "ID of the network to which the PostgreSQL cluster belongs"
  type        = string
}

variable "description" {
  description = "Description of the PostgreSQL cluster"
  type        = string
  default     = ""
}

variable "folder_id" {
  description = "ID of the folder that the resource belongs to"
  type        = string
  default     = null
}

variable "labels" {
  description = "A set of key/value label pairs to assign to the PostgreSQL cluster"
  type        = map(string)
  default     = {}
}

variable "security_group_ids" {
  description = "A set of IDs of security groups assigned to hosts of the cluster"
  type        = list(string)
  default     = []
}

variable "deletion_protection" {
  description = "Inhibits deletion of the cluster"
  type        = bool
  default     = false
}

variable "config" {
  description = "Configuration of the PostgreSQL cluster"
  type = object({
    version = string
    resources = object({
      resource_preset_id = string
      disk_type_id       = string
      disk_size          = number
    })
    postgresql_config = map(string)
  })
}

variable "hosts" {
  description = "A list of hosts in the PostgreSQL cluster"
  type = list(object({
    zone                    = string
    subnet_id               = string
    assign_public_ip        = bool
    name                    = optional(string)
    priority                = optional(number)
    replication_source_name = optional(string)
  }))
}

variable "maintenance_window" {
  description = "Maintenance policy of the PostgreSQL cluster"
  type = object({
    type = string
    day  = string
    hour = number
  })
}
