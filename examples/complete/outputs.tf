output "id" {
  description = "ID of the PostgreSQL cluster"
  value       = module.postgresql_cluster.cluster_id
}

output "name" {
  description = "Name of the PostgreSQL cluster"
  value       = module.postgresql_cluster.name
}

output "environment" {
  description = "Deployment environment of the PostgreSQL cluster"
  value       = module.postgresql_cluster.environment
}

output "network_id" {
  description = "ID of the network to which the PostgreSQL cluster belongs"
  value       = module.postgresql_cluster.network_id
}

output "description" {
  description = "Description of the PostgreSQL cluster"
  value       = module.postgresql_cluster.description
}

output "folder_id" {
  description = "ID of the folder that the resource belongs to"
  value       = module.postgresql_cluster.folder_id
}

output "labels" {
  description = "A set of key/value label pairs to assign to the PostgreSQL cluster"
  value       = module.postgresql_cluster.labels
}

output "security_group_ids" {
  description = "A set of IDs of security groups assigned to hosts of the cluster"
  value       = module.postgresql_cluster.security_group_ids
}

output "deletion_protection" {
  description = "Inhibits deletion of the cluster"
  value       = module.postgresql_cluster.deletion_protection
}

output "config" {
  description = "Configuration of the PostgreSQL cluster"
  value       = module.postgresql_cluster.config
}

output "hosts" {
  description = "A list of hosts in the PostgreSQL cluster"
  value       = module.postgresql_cluster.hosts
}

output "maintenance_window" {
  description = "Maintenance policy of the PostgreSQL cluster"
  value       = module.postgresql_cluster.maintenance_window
}
