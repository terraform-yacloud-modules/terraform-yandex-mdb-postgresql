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
| [yandex_mdb_postgresql_database.postgresql_database](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_postgresql_database) | resource |
| [yandex_mdb_postgresql_user.postgresql_user](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_postgresql_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access"></a> [access](#input\_access) | Access policy to the PostgreSQL cluster | <pre>object({<br>    data_lens     = optional(bool)<br>    web_sql       = optional(bool)<br>    serverless    = optional(bool)<br>    data_transfer = optional(bool)<br>  })</pre> | `null` | no |
| <a name="input_backup_window_start"></a> [backup\_window\_start](#input\_backup\_window\_start) | Time to start the daily backup, in the UTC timezone | <pre>object({<br>    hours   = optional(number)<br>    minutes = optional(number)<br>  })</pre> | `null` | no |
| <a name="input_database_deletion_protection"></a> [database\_deletion\_protection](#input\_database\_deletion\_protection) | Inhibits deletion of the database | `bool` | `null` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The name of the database | `string` | n/a | yes |
| <a name="input_database_owner"></a> [database\_owner](#input\_database\_owner) | Name of the user assigned as the owner of the database | `string` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Inhibits deletion of the cluster | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the PostgreSQL cluster | `string` | `null` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Volume of the storage available to a PostgreSQL host, in gigabytes | `number` | n/a | yes |
| <a name="input_disk_type_id"></a> [disk\_type\_id](#input\_disk\_type\_id) | Type of the storage of PostgreSQL hosts | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment of the PostgreSQL cluster | `string` | `"PRODUCTION"` | no |
| <a name="input_extensions"></a> [extensions](#input\_extensions) | Set of database extensions | <pre>list(object({<br>    name    = string<br>    version = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | ID of the folder that the resource belongs to | `string` | `null` | no |
| <a name="input_hosts"></a> [hosts](#input\_hosts) | A list of hosts in the PostgreSQL cluster | <pre>list(object({<br>    zone                    = string<br>    subnet_id               = string<br>    assign_public_ip        = bool<br>    name                    = optional(string)<br>    priority                = optional(number)<br>    replication_source_name = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | A set of key/value label pairs to assign to the PostgreSQL cluster | `map(string)` | `{}` | no |
| <a name="input_lc_collate"></a> [lc\_collate](#input\_lc\_collate) | POSIX locale for string sorting order | `string` | `null` | no |
| <a name="input_lc_type"></a> [lc\_type](#input\_lc\_type) | POSIX locale for character classification | `string` | `null` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Maintenance policy of the PostgreSQL cluster | <pre>object({<br>    type = string<br>    day  = optional(string, null)<br>    hour = optional(number, null)<br>  })</pre> | <pre>{<br>  "type": "ANYTIME"<br>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the PostgreSQL cluster | `string` | n/a | yes |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | ID of the network to which the PostgreSQL cluster belongs | `string` | n/a | yes |
| <a name="input_performance_diagnostics"></a> [performance\_diagnostics](#input\_performance\_diagnostics) | Cluster performance diagnostics settings | <pre>object({<br>    enabled                      = optional(bool)<br>    sessions_sampling_interval   = optional(number)<br>    statements_sampling_interval = optional(number)<br>  })</pre> | `null` | no |
| <a name="input_pooler_config"></a> [pooler\_config](#input\_pooler\_config) | Configuration of the connection pooler | <pre>object({<br>    pool_discard = optional(bool)<br>    pooling_mode = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_postgresql_config"></a> [postgresql\_config](#input\_postgresql\_config) | PostgreSQL cluster config | `map(string)` | `{}` | no |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | Version of the PostgreSQL cluster | `string` | n/a | yes |
| <a name="input_resource_preset_id"></a> [resource\_preset\_id](#input\_resource\_preset\_id) | The ID of the preset for computational resources available to a PostgreSQL host | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A set of IDs of security groups assigned to hosts of the cluster | `list(string)` | `[]` | no |
| <a name="input_template_db"></a> [template\_db](#input\_template\_db) | Name of the template database | `string` | `null` | no |
| <a name="input_user_conn_limit"></a> [user\_conn\_limit](#input\_user\_conn\_limit) | The maximum number of connections per user | `number` | `50` | no |
| <a name="input_user_deletion_protection"></a> [user\_deletion\_protection](#input\_user\_deletion\_protection) | Inhibits deletion of the user | `bool` | `false` | no |
| <a name="input_user_grants"></a> [user\_grants](#input\_user\_grants) | List of the user's grants | `list(string)` | `[]` | no |
| <a name="input_user_login"></a> [user\_login](#input\_user\_login) | User's ability to login | `bool` | `true` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | The name of the user | `string` | n/a | yes |
| <a name="input_user_password"></a> [user\_password](#input\_user\_password) | The password of the user | `string` | n/a | yes |
| <a name="input_user_settings"></a> [user\_settings](#input\_user\_settings) | Map of user settings | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_config"></a> [config](#output\_config) | Configuration of the PostgreSQL cluster |
| <a name="output_deletion_protection"></a> [deletion\_protection](#output\_deletion\_protection) | Inhibits deletion of the cluster |
| <a name="output_description"></a> [description](#output\_description) | Description of the PostgreSQL cluster |
| <a name="output_environment"></a> [environment](#output\_environment) | Deployment environment of the PostgreSQL cluster |
| <a name="output_folder_id"></a> [folder\_id](#output\_folder\_id) | ID of the folder that the resource belongs to |
| <a name="output_hosts"></a> [hosts](#output\_hosts) | A list of hosts in the PostgreSQL cluster |
| <a name="output_id"></a> [id](#output\_id) | ID of the PostgreSQL cluster |
| <a name="output_labels"></a> [labels](#output\_labels) | A set of key/value label pairs to assign to the PostgreSQL cluster |
| <a name="output_maintenance_window"></a> [maintenance\_window](#output\_maintenance\_window) | Maintenance policy of the PostgreSQL cluster |
| <a name="output_name"></a> [name](#output\_name) | Name of the PostgreSQL cluster |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID of the network to which the PostgreSQL cluster belongs |
| <a name="output_security_group_ids"></a> [security\_group\_ids](#output\_security\_group\_ids) | A set of IDs of security groups assigned to hosts of the cluster |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Apache-2.0 Licensed.
See [LICENSE](https://github.com/terraform-yacloud-modules/terraform-yandex-module-template/blob/main/LICENSE).
