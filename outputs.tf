output "cluster_id" {
  description = "PostgreSQL cluster ID"
  value       = yandex_mdb_postgresql_cluster.main.id
}

output "cluster_name" {
  description = "PostgreSQL cluster name"
  value       = yandex_mdb_postgresql_cluster.main.name
}

output "cluster_host_names_list" {
  description = "PostgreSQL cluster host name"
  value       = [yandex_mdb_postgresql_cluster.main.host[*].name]
}

output "cluster_fqdns_list" {
  description = "PostgreSQL cluster nodes FQDN list"
  value       = [yandex_mdb_postgresql_cluster.main.host[*].fqdn]
}

output "name" {
  description = "Name of the PostgreSQL cluster"
  value       = yandex_mdb_postgresql_cluster.main.name
}

output "environment" {
  description = "Deployment environment of the PostgreSQL cluster"
  value       = yandex_mdb_postgresql_cluster.main.environment
}

output "network_id" {
  description = "ID of the network to which the PostgreSQL cluster belongs"
  value       = yandex_mdb_postgresql_cluster.main.network_id
}

output "description" {
  description = "Description of the PostgreSQL cluster"
  value       = yandex_mdb_postgresql_cluster.main.description
}

output "folder_id" {
  description = "ID of the folder that the resource belongs to"
  value       = yandex_mdb_postgresql_cluster.main.folder_id
}

output "labels" {
  description = "A set of key/value label pairs to assign to the PostgreSQL cluster"
  value       = yandex_mdb_postgresql_cluster.main.labels
}

output "security_group_ids" {
  description = "A set of IDs of security groups assigned to hosts of the cluster"
  value       = yandex_mdb_postgresql_cluster.main.security_group_ids
}

output "deletion_protection" {
  description = "Inhibits deletion of the cluster"
  value       = yandex_mdb_postgresql_cluster.main.deletion_protection
}

output "config" {
  description = "Configuration of the PostgreSQL cluster"
  value       = yandex_mdb_postgresql_cluster.main.config
}

output "hosts" {
  description = "A list of hosts in the PostgreSQL cluster"
  value       = yandex_mdb_postgresql_cluster.main.host
}

output "maintenance_window" {
  description = "Maintenance policy of the PostgreSQL cluster"
  value       = yandex_mdb_postgresql_cluster.main.maintenance_window
}

output "owners_data" {
  description = "List of owners with passwords"
  sensitive   = true
  value = [
    for u in yandex_mdb_postgresql_user.owner : {
      user     = u.name
      password = u.password
    }
  ]
}

output "users_data" {
  description = "List of users with passwords"
  sensitive   = true
  value = [
    for u in yandex_mdb_postgresql_user.user : {
      user     = u.name
      password = u.password
    }
  ]
}

output "databases" {
  description = "List of databases names"
  value       = [for db in var.databases : db.name]
}
