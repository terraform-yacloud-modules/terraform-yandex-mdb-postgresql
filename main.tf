resource "yandex_mdb_postgresql_cluster" "postgresql_cluster" {
  name                = var.name
  environment         = var.environment
  network_id          = var.network_id
  description         = var.description
  folder_id           = var.folder_id
  labels              = var.labels
  security_group_ids  = var.security_group_ids
  deletion_protection = var.deletion_protection

  config {
    version = var.postgresql_version
    resources {
      resource_preset_id = var.resource_preset_id
      disk_type_id       = var.disk_type_id
      disk_size          = var.disk_size
    }
    postgresql_config = var.postgresql_config
  }

  dynamic "host" {
    for_each = var.hosts
    content {
      zone                    = host.value.zone
      subnet_id               = host.value.subnet_id
      assign_public_ip        = host.value.assign_public_ip
      name                    = host.value.name
      priority                = host.value.priority
      replication_source_name = host.value.replication_source_name
    }
  }

  maintenance_window {
    type = var.maintenance_window.type
    day  = var.maintenance_window.day
    hour = var.maintenance_window.hour
  }
}
