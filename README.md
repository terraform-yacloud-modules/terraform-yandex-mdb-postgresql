# Yandex Cloud <RESOURCE> Terraform module

Terraform module which creates Yandex Cloud <RESOURCE> resources.

## Examples

Examples codified under
the [`examples`](https://github.com/terraform-yacloud-modules/terraform-yandex-module-template/tree/main/examples) are intended
to give users references for how to use the module(s) as well as testing/validating changes to the source code of the
module. If contributing to the project, please be sure to make any appropriate updates to the relevant examples to allow
maintainers to test your changes and to keep the examples up to date for users. Thank you!

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.72.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.72.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_mdb_postgresql_cluster.postgresql_cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_postgresql_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access"></a> [access](#input\_access) | Access policy to the PostgreSQL cluster | <pre>object({<br>    data_lens     = optional(bool)<br>    web_sql       = optional(bool)<br>    serverless    = optional(bool)<br>    data_transfer = optional(bool)<br>  })</pre> | `null` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Inhibits deletion of the cluster | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the PostgreSQL cluster | `string` | `null` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Volume of the storage available to a PostgreSQL host, in gigabytes | `number` | n/a | yes |
| <a name="input_disk_type_id"></a> [disk\_type\_id](#input\_disk\_type\_id) | Type of the storage of PostgreSQL hosts | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment of the PostgreSQL cluster | `string` | `"PRODUCTION"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | ID of the folder that the resource belongs to | `string` | `null` | no |
| <a name="input_hosts"></a> [hosts](#input\_hosts) | A list of hosts in the PostgreSQL cluster | <pre>list(object({<br>    zone                    = string<br>    subnet_id               = string<br>    assign_public_ip        = bool<br>    name                    = optional(string)<br>    priority                = optional(number)<br>    replication_source_name = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | A set of key/value label pairs to assign to the PostgreSQL cluster | `map(string)` | `{}` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Maintenance policy of the PostgreSQL cluster | <pre>object({<br>    type = string<br>    day  = optional(string, null)<br>    hour = optional(number, null)<br>  })</pre> | <pre>{<br>  "type": "ANYTIME"<br>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the PostgreSQL cluster | `string` | n/a | yes |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | ID of the network to which the PostgreSQL cluster belongs | `string` | n/a | yes |
| <a name="input_performance_diagnostics"></a> [performance\_diagnostics](#input\_performance\_diagnostics) | Cluster performance diagnostics settings | <pre>object({<br>    enabled                      = optional(bool)<br>    sessions_sampling_interval   = optional(number)<br>    statements_sampling_interval = optional(number)<br>  })</pre> | `null` | no |
| <a name="input_postgresql_config"></a> [postgresql\_config](#input\_postgresql\_config) | PostgreSQL cluster config | `map(string)` | `{}` | no |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | Version of the PostgreSQL cluster | `string` | n/a | yes |
| <a name="input_resource_preset_id"></a> [resource\_preset\_id](#input\_resource\_preset\_id) | The ID of the preset for computational resources available to a PostgreSQL host | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A set of IDs of security groups assigned to hosts of the cluster | `list(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Apache-2.0 Licensed.
See [LICENSE](https://github.com/terraform-yacloud-modules/terraform-yandex-module-template/blob/main/LICENSE).
