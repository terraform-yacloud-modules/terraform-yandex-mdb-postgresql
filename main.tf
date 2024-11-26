resource "yandex_mdb_postgresql_cluster" "main" {
  name                = var.name
  environment         = var.environment
  network_id          = var.network_id
  description         = var.description
  folder_id           = var.folder_id
  labels              = var.labels
  security_group_ids  = var.security_group_ids
  deletion_protection = var.deletion_protection

  dynamic "restore" {
    for_each = var.restore != null ? [var.restore] : []
    content {
      backup_id      = restore.value.backup_id
      time           = restore.value.time
      time_inclusive = restore.value.time_inclusive
    }
  }

  config {
    version = var.postgresql_version
    resources {
      resource_preset_id = var.resource_preset_id
      disk_type_id       = var.disk_type_id
      disk_size          = var.disk_size
    }
    postgresql_config = var.postgresql_config

    dynamic "access" {
      for_each = var.access != null ? [var.access] : []
      content {
        data_lens     = access.value.data_lens
        web_sql       = access.value.web_sql
        serverless    = access.value.serverless
        data_transfer = access.value.data_transfer
      }
    }

    dynamic "performance_diagnostics" {
      for_each = var.performance_diagnostics != null ? [var.performance_diagnostics] : []
      content {
        enabled                      = performance_diagnostics.value.enabled
        sessions_sampling_interval   = performance_diagnostics.value.sessions_sampling_interval
        statements_sampling_interval = performance_diagnostics.value.statements_sampling_interval
      }
    }

    dynamic "backup_window_start" {
      for_each = var.backup_window_start != null ? [var.backup_window_start] : []
      content {
        hours   = backup_window_start.value.hours
        minutes = backup_window_start.value.minutes
      }
    }

    dynamic "pooler_config" {
      for_each = var.pooler_config != null ? [var.pooler_config] : []
      content {
        pool_discard = pooler_config.value.pool_discard
        pooling_mode = pooler_config.value.pooling_mode
      }
    }

    dynamic "disk_size_autoscaling" {
      for_each = var.disk_size_autoscaling != null ? [var.disk_size_autoscaling] : []
      content {
        disk_size_limit           = disk_size_autoscaling.value.disk_size_limit
        planned_usage_threshold   = disk_size_autoscaling.value.planned_usage_threshold
        emergency_usage_threshold = disk_size_autoscaling.value.emergency_usage_threshold
      }
    }

    autofailover              = var.autofailover
    backup_retain_period_days = var.backup_retain_period_days
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

  dynamic "maintenance_window" {
    for_each = [var.maintenance_window]
    content {
      type = lookup(maintenance_window.value, "type", "ANYTIME")
      day  = lookup(maintenance_window.value, "day", null)
      hour = lookup(maintenance_window.value, "hour", null)
    }
  }
}
