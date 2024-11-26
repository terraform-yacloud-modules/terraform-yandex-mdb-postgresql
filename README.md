# Yandex Cloud PostgreSQL Terraform module

Terraform module which creates Yandex Cloud PostgreSQL resources.

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
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.72.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [yandex_mdb_postgresql_cluster.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_postgresql_cluster) | resource |
| [yandex_mdb_postgresql_database.database](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_postgresql_database) | resource |
| [yandex_mdb_postgresql_user.owner](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_postgresql_user) | resource |
| [yandex_mdb_postgresql_user.user](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_postgresql_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access"></a> [access](#input\_access) | Access policy to the PostgreSQL cluster | <pre>object({<br/>    data_lens     = optional(bool)<br/>    web_sql       = optional(bool)<br/>    serverless    = optional(bool)<br/>    data_transfer = optional(bool)<br/>  })</pre> | `null` | no |
| <a name="input_autofailover"></a> [autofailover](#input\_autofailover) | Configuration setting which enables/disables autofailover in cluster | `bool` | `true` | no |
| <a name="input_backup_retain_period_days"></a> [backup\_retain\_period\_days](#input\_backup\_retain\_period\_days) | The period in days during which backups are stored | `number` | `7` | no |
| <a name="input_backup_window_start"></a> [backup\_window\_start](#input\_backup\_window\_start) | Time to start the daily backup, in the UTC timezone | <pre>object({<br/>    hours   = optional(number)<br/>    minutes = optional(number)<br/>  })</pre> | `null` | no |
| <a name="input_databases"></a> [databases](#input\_databases) | List of PostgreSQL databases.<br/><br/>    Values:<br/>      - name                - (Required) The name of the database.<br/>      - owner               - (Required) Name of the user assigned as the owner of the database. Forbidden to change in an existing database.<br/>      - extension           - (Optional) Set of database extensions.<br/>      - lc\_collate          - (Optional) POSIX locale for string sorting order. Forbidden to change in an existing database.<br/>      - lc\_type             - (Optional) POSIX locale for character classification. Forbidden to change in an existing database.<br/>      - template\_db         - (Optional) Name of the template database.<br/>      - deletion\_protection - (Optional) A deletion protection. | <pre>list(object({<br/>    name                = string<br/>    owner               = string<br/>    lc_collate          = optional(string, null)<br/>    lc_type             = optional(string, null)<br/>    template_db         = optional(string, null)<br/>    deletion_protection = optional(bool, null)<br/>    extensions          = optional(list(string), [])<br/>  }))</pre> | n/a | yes |
| <a name="input_default_user_settings"></a> [default\_user\_settings](#input\_default\_user\_settings) | The default user settings. These settings are overridden by the user's settings.<br/>    Full description https://cloud.yandex.com/en-ru/docs/managed-postgresql/api-ref/grpc/user_service#UserSettings1 | `map(any)` | `{}` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Inhibits deletion of the cluster | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the PostgreSQL cluster | `string` | `null` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Volume of the storage available to a PostgreSQL host, in gigabytes | `number` | n/a | yes |
| <a name="input_disk_size_autoscaling"></a> [disk\_size\_autoscaling](#input\_disk\_size\_autoscaling) | Cluster disk size autoscaling settings | <pre>object({<br/>    disk_size_limit           = number<br/>    planned_usage_threshold   = number<br/>    emergency_usage_threshold = number<br/>  })</pre> | `null` | no |
| <a name="input_disk_type_id"></a> [disk\_type\_id](#input\_disk\_type\_id) | Type of the storage of PostgreSQL hosts | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment type: PRODUCTION or PRESTABLE | `string` | `"PRODUCTION"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | ID of the folder that the resource belongs to | `string` | `null` | no |
| <a name="input_hosts"></a> [hosts](#input\_hosts) | A list of hosts in the PostgreSQL cluster | <pre>list(object({<br/>    zone                    = string<br/>    subnet_id               = string<br/>    assign_public_ip        = bool<br/>    name                    = optional(string)<br/>    priority                = optional(number)<br/>    replication_source_name = optional(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | A set of key/value label pairs to assign to the PostgreSQL cluster | `map(string)` | `{}` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Maintenance policy of the PostgreSQL cluster | <pre>object({<br/>    type = string<br/>    day  = optional(string, null)<br/>    hour = optional(number, null)<br/>  })</pre> | <pre>{<br/>  "type": "ANYTIME"<br/>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the PostgreSQL cluster | `string` | n/a | yes |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | ID of the network to which the PostgreSQL cluster belongs | `string` | n/a | yes |
| <a name="input_owners"></a> [owners](#input\_owners) | List of special PostgreSQL DB users - database owners. These users are created first and assigned to database as owner.<br/>    There is also an additional list for other users with own permissions.<br/><br/>    Values:<br/>      - name                - (Required) The name of the user.<br/>      - password            - (Optional) The user's password. If it's omitted a random password will be generated.<br/>      - grants              - (Optional) List of the user's grants.<br/>      - login               - (Optional) The user's ability to login.<br/>      - conn\_limit          - (Optional) The maximum number of connections per user.<br/>      - settings            - (Optional) A user setting options.<br/>      - deletion\_protection - (Optional) A deletion protection. | <pre>list(object({<br/>    name                = string<br/>    password            = optional(string, null)<br/>    grants              = optional(list(string), [])<br/>    login               = optional(bool, true)<br/>    conn_limit          = optional(number, 50)<br/>    settings            = optional(map(any), {})<br/>    deletion_protection = optional(bool, false)<br/>  }))</pre> | n/a | yes |
| <a name="input_performance_diagnostics"></a> [performance\_diagnostics](#input\_performance\_diagnostics) | Cluster performance diagnostics settings | <pre>object({<br/>    enabled                      = optional(bool)<br/>    sessions_sampling_interval   = optional(number)<br/>    statements_sampling_interval = optional(number)<br/>  })</pre> | `null` | no |
| <a name="input_pooler_config"></a> [pooler\_config](#input\_pooler\_config) | Configuration of the connection pooler | <pre>object({<br/>    pool_discard = optional(bool)<br/>    pooling_mode = optional(string)<br/>  })</pre> | `null` | no |
| <a name="input_postgresql_config"></a> [postgresql\_config](#input\_postgresql\_config) | PostgreSQL cluster config | `map(string)` | `{}` | no |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | Version of the PostgreSQL cluster | `string` | n/a | yes |
| <a name="input_resource_preset_id"></a> [resource\_preset\_id](#input\_resource\_preset\_id) | The ID of the preset for computational resources available to a PostgreSQL host | `string` | n/a | yes |
| <a name="input_restore"></a> [restore](#input\_restore) | The cluster will be created from the specified backup | <pre>object({<br/>    backup_id      = string<br/>    time           = optional(string)<br/>    time_inclusive = optional(bool)<br/>  })</pre> | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A set of IDs of security groups assigned to hosts of the cluster | `list(string)` | `[]` | no |
| <a name="input_users"></a> [users](#input\_users) | List of additional PostgreSQL users with own permissions. They are created at the end.<br/><br/>    Required values:<br/>      - name                - (Required) The name of the user.<br/>      - password            - (Optional) The user's password. If it's omitted a random password will be generated.<br/>      - grants              - (Optional) List of the user's grants.<br/>      - login               - (Optional) The user's ability to login.<br/>      - conn\_limit          - (Optional) The maximum number of connections per user.<br/>      - permissions         - (Optional) List of databases names for an access<br/>      - settings            - (Optional) A user setting options.<br/>      - deletion\_protection - (Optional) A deletion protection. | <pre>list(object({<br/>    name                = string<br/>    password            = optional(string, null)<br/>    grants              = optional(list(string), [])<br/>    login               = optional(bool, null)<br/>    conn_limit          = optional(number, null)<br/>    permissions         = optional(list(string), [])<br/>    settings            = optional(map(any), {})<br/>    deletion_protection = optional(bool, null)<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_fqdns_list"></a> [cluster\_fqdns\_list](#output\_cluster\_fqdns\_list) | PostgreSQL cluster nodes FQDN list |
| <a name="output_cluster_host_names_list"></a> [cluster\_host\_names\_list](#output\_cluster\_host\_names\_list) | PostgreSQL cluster host name |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | PostgreSQL cluster ID |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | PostgreSQL cluster name |
| <a name="output_config"></a> [config](#output\_config) | Configuration of the PostgreSQL cluster |
| <a name="output_databases"></a> [databases](#output\_databases) | List of databases names |
| <a name="output_deletion_protection"></a> [deletion\_protection](#output\_deletion\_protection) | Inhibits deletion of the cluster |
| <a name="output_description"></a> [description](#output\_description) | Description of the PostgreSQL cluster |
| <a name="output_environment"></a> [environment](#output\_environment) | Deployment environment of the PostgreSQL cluster |
| <a name="output_folder_id"></a> [folder\_id](#output\_folder\_id) | ID of the folder that the resource belongs to |
| <a name="output_hosts"></a> [hosts](#output\_hosts) | A list of hosts in the PostgreSQL cluster |
| <a name="output_labels"></a> [labels](#output\_labels) | A set of key/value label pairs to assign to the PostgreSQL cluster |
| <a name="output_maintenance_window"></a> [maintenance\_window](#output\_maintenance\_window) | Maintenance policy of the PostgreSQL cluster |
| <a name="output_name"></a> [name](#output\_name) | Name of the PostgreSQL cluster |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID of the network to which the PostgreSQL cluster belongs |
| <a name="output_owners_data"></a> [owners\_data](#output\_owners\_data) | List of owners with passwords |
| <a name="output_security_group_ids"></a> [security\_group\_ids](#output\_security\_group\_ids) | A set of IDs of security groups assigned to hosts of the cluster |
| <a name="output_users_data"></a> [users\_data](#output\_users\_data) | List of users with passwords |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Apache-2.0 Licensed.
See [LICENSE](https://github.com/terraform-yacloud-modules/terraform-yandex-module-template/blob/main/LICENSE).
