variable "name" {
  description = "Name of the PostgreSQL cluster"
  type        = string
}

variable "environment" {
  description = "Environment type: PRODUCTION or PRESTABLE"
  type        = string
  default     = "PRODUCTION"
  validation {
    condition     = contains(["PRODUCTION", "PRESTABLE"], var.environment)
    error_message = "Release channel should be PRODUCTION (stable feature set) or PRESTABLE (early bird feature access)."
  }
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

variable "restore" {
  description = "The cluster will be created from the specified backup"
  type = object({
    backup_id      = string
    time           = optional(string)
    time_inclusive = optional(bool)
  })
  default = null
}

variable "disk_size_autoscaling" {
  description = "Cluster disk size autoscaling settings"
  type = object({
    disk_size_limit           = number
    planned_usage_threshold   = number
    emergency_usage_threshold = number
  })
  default = null
}

variable "autofailover" {
  description = "Configuration setting which enables/disables autofailover in cluster"
  type        = bool
  default     = true
}

variable "backup_retain_period_days" {
  description = "The period in days during which backups are stored"
  type        = number
  default     = 7
}

#
# users
#
variable "default_user_settings" {
  description = <<EOF
    The default user settings. These settings are overridden by the user's settings.
    Full description https://cloud.yandex.com/en-ru/docs/managed-postgresql/api-ref/grpc/user_service#UserSettings1
  EOF
  type        = map(any)
  default     = {}
}

variable "owners" {
  description = <<EOF
    List of special PostgreSQL DB users - database owners. These users are created first and assigned to database as owner.
    There is also an additional list for other users with own permissions.

    Values:
      - name                - (Required) The name of the user.
      - password            - (Optional) The user's password. If it's omitted a random password will be generated.
      - grants              - (Optional) List of the user's grants.
      - login               - (Optional) The user's ability to login.
      - conn_limit          - (Optional) The maximum number of connections per user.
      - settings            - (Optional) A user setting options.
      - deletion_protection - (Optional) A deletion protection.
  EOF
  type = list(object({
    name                = string
    password            = optional(string, null)
    grants              = optional(list(string), [])
    login               = optional(bool, true)
    conn_limit          = optional(number, 50)
    settings            = optional(map(any), {})
    deletion_protection = optional(bool, false)
  }))
  validation {
    condition     =  (var.owners == [] || var.owners == null) ? true : !alltrue([for item in [for user in var.owners : user.name] : contains(["admin", "repl", "monitor", "postgres", "mdb_admin", "mdb_monitor", "mdb_replication"], item)])
    error_message = "The user name field must not contain any of the following disallowed usernames: admin, repl, monitor, postgres, mdb_admin, mdb_monitor, mdb_replication"
  }
}

variable "users" {
  description = <<EOF
    List of additional PostgreSQL users with own permissions. They are created at the end.

    Required values:
      - name                - (Required) The name of the user.
      - password            - (Optional) The user's password. If it's omitted a random password will be generated.
      - grants              - (Optional) List of the user's grants.
      - login               - (Optional) The user's ability to login.
      - conn_limit          - (Optional) The maximum number of connections per user.
      - permissions         - (Optional) List of databases names for an access
      - settings            - (Optional) A user setting options.
      - deletion_protection - (Optional) A deletion protection.
  EOF
  type = list(object({
    name                = string
    password            = optional(string, null)
    grants              = optional(list(string), [])
    login               = optional(bool, null)
    conn_limit          = optional(number, null)
    permissions         = optional(list(string), [])
    settings            = optional(map(any), {})
    deletion_protection = optional(bool, null)
  }))
  default = []

  validation {
    condition     = (var.users == [] || var.users == null) ? true : !alltrue([for item in [for user in var.users : user.name] : contains(["admin", "repl", "monitor", "postgres", "mdb_admin", "mdb_monitor", "mdb_replication"], item)])
    error_message = "The user name field must not contain any of the following disallowed usernames: admin, repl, monitor, postgres, mdb_admin, mdb_monitor, mdb_replication"
  }
}

#
# databases
#
variable "databases" {
  description = <<EOF
    List of PostgreSQL databases.

    Values:
      - name                - (Required) The name of the database.
      - owner               - (Required) Name of the user assigned as the owner of the database. Forbidden to change in an existing database.
      - extension           - (Optional) Set of database extensions.
      - lc_collate          - (Optional) POSIX locale for string sorting order. Forbidden to change in an existing database.
      - lc_type             - (Optional) POSIX locale for character classification. Forbidden to change in an existing database.
      - template_db         - (Optional) Name of the template database.
      - deletion_protection - (Optional) A deletion protection.
  EOF
  type = list(object({
    name                = string
    owner               = string
    lc_collate          = optional(string, null)
    lc_type             = optional(string, null)
    template_db         = optional(string, null)
    deletion_protection = optional(bool, null)
    extensions          = optional(list(string), [])
  }))

  validation {
    condition     = !alltrue([for item in [for database in var.databases : database.owner] : contains(["admin", "repl", "monitor", "postgres", "mdb_admin", "mdb_monitor", "mdb_replication"], item)])
    error_message = "The owner field must not contain any of the following disallowed usernames: admin, repl, monitor, postgres, mdb_admin, mdb_monitor, mdb_replication"
  }
}
