variable "name" {
  description = "Name of the PostgreSQL cluster"
  type        = string
}

variable "environment" {
  description = "Deployment environment of the PostgreSQL cluster"
  type        = string
  default     = "PRODUCTION" # "PRODUCTION" or "PRESTABLE"
}

variable "network_id" {
  description = "ID of the network to which the PostgreSQL cluster belongs"
  type        = string
}

variable "description" {
  description = "Description of the PostgreSQL cluster"
  type        = string
  default     = null
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

variable "postgresql_version" {
  description = "Version of the PostgreSQL cluster"
  type        = string
}

variable "resource_preset_id" {
  description = "The ID of the preset for computational resources available to a PostgreSQL host"
  type        = string
}

variable "disk_size" {
  description = "Volume of the storage available to a PostgreSQL host, in gigabytes"
  type        = number
}

variable "disk_type_id" {
  description = "Type of the storage of PostgreSQL hosts"
  type        = string
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

variable "postgresql_config" {
  description = "PostgreSQL cluster config"
  type        = map(string)
  default     = {}
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
    day  = optional(string, null)
    hour = optional(number, null)
  })
  default = {
    type = "ANYTIME"
  }
}

variable "access" {
  description = "Access policy to the PostgreSQL cluster"
  type = object({
    data_lens     = optional(bool)
    web_sql       = optional(bool)
    serverless    = optional(bool)
    data_transfer = optional(bool)
  })
  default = null
}

variable "performance_diagnostics" {
  description = "Cluster performance diagnostics settings"
  type = object({
    enabled                      = optional(bool)
    sessions_sampling_interval   = optional(number)
    statements_sampling_interval = optional(number)
  })
  default = null
}

variable "backup_window_start" {
  description = "Time to start the daily backup, in the UTC timezone"
  type = object({
    hours   = optional(number)
    minutes = optional(number)
  })
  default = null
}

variable "pooler_config" {
  description = "Configuration of the connection pooler"
  type = object({
    pool_discard = optional(bool)
    pooling_mode = optional(string)
  })
  default = null
}
