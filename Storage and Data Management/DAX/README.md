## Prerequisites

1.  VPC should be available
2.  Subnets in the VPC should be in place
3.  Security Groups attached to the VPC should be in place 
4.  IAM role for DAX to access DynamodDB should be in place
5.  If notification setup is required, the SNS topic should be in place

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |


## Resources

| Name | Type |
|------|------|
| [aws_dax_cluster.dax_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dax_cluster) | resource |
| [aws_dax_parameter_group.dax_parameter_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dax_parameter_group) | resource |
| [aws_dax_subnet_group.dax_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dax_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of Availability Zones in which the nodes will be created | `list(string)` | `[]` | no |
| <a name="input_cluster_endpoint_encryption_type"></a> [cluster\_endpoint\_encryption\_type](#input\_cluster\_endpoint\_encryption\_type) | The type of encryption the cluster's endpoint should support. Valid values are NONE and TLS | `string` | `"NONE"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of Cluster | `string` | n/a | yes |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | ARN that identifies an IAM role that needs to be attached to the cluster | `string` | n/a | yes |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Specifies the weekly time range for when maintenance on the cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period | `string` | `"sun:08:00-sun:12:00"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of nodes in the DAX cluster. If 1 then it will create a single-node cluster, without any read replicas | `number` | `1` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | VM type for the cluster machines. Currently only t and r type nodes are allowed as node type for the cluster | `string` | n/a | yes |
| <a name="input_notification_topic_arn"></a> [notification\_topic\_arn](#input\_notification\_topic\_arn) | ARN of an SNS topic to send DAX notifications to | `string` | `null` | no |
| <a name="input_query_ttl"></a> [query\_ttl](#input\_query\_ttl) | Query Time To Live in milliseconds | `string` | `"300000"` | no |
| <a name="input_record_ttl"></a> [record\_ttl](#input\_record\_ttl) | Record Time To Live in milliseconds | `string` | `"300000"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | One or more VPC security groups to be associated with the cluster | `list(string)` | n/a | yes |
| <a name="input_server_side_encryption"></a> [server\_side\_encryption](#input\_server\_side\_encryption) | Encrypt at rest options | `bool` | `true` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of Subnets in which the Cluster Group will be attached | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be associated to the DynamoDB table | `map(string)` | <pre>{<br>  "CreatedBy": "Terraform",<br>  "Environment": "Testing",<br>  "name": "P03_Sachin",<br>  "owner": "",<br>  "pid": "P03",<br>  "prj-name": "AWS GDS CIL Team"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_address"></a> [cluster\_address](#output\_cluster\_address) | DNS name of the DAX cluster without the port appended |
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | ARN of the DAX cluster |
| <a name="output_configuration_endpoint"></a> [configuration\_endpoint](#output\_configuration\_endpoint) | Configuration endpoint for this DAX cluster, consisting of a DNS name and a port number |


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_create_dax"></a> [create\_dax](#module\_create\_dax) | ../../DAX | n/a |

```
module "create_dax" {
    source = "../../DAX"

    availability_zones               = ["us-west-2b", "us-west-2c"]
    cluster_name                     = "test-dax"
    cluster_endpoint_encryption_type = "TLS"
    iam_role_arn                     = "arn:aws:iam::239312700453:role/DAX_dynamoDB"
    maintenance_window               = "sun:08:00-sun:12:00"
    node_count                       = 2
    node_type                        = "dax.t2.small"
    notification_topic_arn           = "arn:aws:iam::239312700453:role/SNS_for_DAX"
    query_ttl                        = "300000"
    record_ttl                       = "300000"
    security_group_ids               = ["sg-0abacbf19f4fac376", "sg-0750fb0777cf9735b"]
    server_side_encryption           = true
    subnet_ids                       = ["subnet-0c44cc0354fb5380a", "subnet-0860766f6f5764cfb"]
    tags = {
        "CreatedBy": "Terraform",
        "Environment": "Testing",
        "name": "P03_Sachin",
        "owner": "",
        "pid": "P03",
        "prj-name": "AWS GDS CIL Team"
    }
}
```