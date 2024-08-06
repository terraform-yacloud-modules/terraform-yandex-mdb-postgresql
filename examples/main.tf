data "yandex_client_config" "client" {}

module "network" {
  source = "git::https://github.com/terraform-yacloud-modules/terraform-yandex-vpc.git?ref=v1.0.0"

  folder_id = data.yandex_client_config.client.folder_id

  blank_name = "vpc-nat-gateway"
  labels = {
    repo = "terraform-yacloud-modules/terraform-yandex-vpc"
  }

  azs = ["ru-central1-a", "ru-central1-b", "ru-central1-d"]

  private_subnets = [["10.4.0.0/24"], ["10.5.0.0/24"], ["10.6.0.0/24"]]

  create_vpc         = true
  create_nat_gateway = true
}

########
module "postgresql_cluster" {
  source = "../"

  name        = "my-postgresql-cluster"
  environment = "PRESTABLE"
  network_id  = module.network.vpc_id
  description = "My PostgreSQL cluster description"
  folder_id   = data.yandex_client_config.client.folder_id

  postgresql_version = "15"

  resource_preset_id = "s2.micro"
  disk_type_id       = "network-ssd"
  disk_size          = 16

  hosts = [
    {
      zone             = "ru-central1-a"
      subnet_id        = module.network.private_subnets_ids[0]
      assign_public_ip = true
      name             = "host-a"
    },
    {
      zone             = "ru-central1-b"
      subnet_id        = module.network.private_subnets_ids[1]
      assign_public_ip = true
      name             = "host-b"
    },
    {
      zone             = "ru-central1-d"
      subnet_id        = module.network.private_subnets_ids[2]
      assign_public_ip = true
      name             = "host-d"
    },
  ]

  postgresql_config = {
    max_connections                   = 395
    enable_parallel_hash              = true
    autovacuum_vacuum_scale_factor    = 0.34
    default_transaction_isolation     = "TRANSACTION_ISOLATION_READ_COMMITTED"
    shared_preload_libraries          = "SHARED_PRELOAD_LIBRARIES_AUTO_EXPLAIN,SHARED_PRELOAD_LIBRARIES_PG_HINT_PLAN"
  }

  maintenance_window = {
    type = "WEEKLY"
    day  = "SAT"
    hour = 12
  }

  depends_on = [module.network]
}
