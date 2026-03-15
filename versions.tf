# Resource docs: https://yandex.cloud/ru/docs/terraform/resources/mdb_postgresql_cluster
# https://yandex.cloud/ru/docs/terraform/resources/mdb_postgresql_database
# https://yandex.cloud/ru/docs/terraform/resources/mdb_postgresql_user
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.100.0"
    }
  }
  required_version = ">= 1.3"
}
