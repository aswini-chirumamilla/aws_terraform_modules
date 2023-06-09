## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.27 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.75.2 |

## Resources

| Name | Type |
|------|------|
| [aws_instance.ec2_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.aws_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_key_pair.key_e2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/key_pair) | data source |
| [aws_subnet.subnet_ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_filter"></a> [ami\_filter](#input\_ami\_filter) | One or more name/value pairs to filter off of | <pre>list(object({<br>    name   = string<br>    values = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | AZ to start the instance in | `string` | `""` | no |
| <a name="input_capacity_reservation_specification"></a> [capacity\_reservation\_specification](#input\_capacity\_reservation\_specification) | Describes an instance's Capacity Reservation targeting option. Optional variables are capacity\_reservation\_preference,capacity\_reservation\_id,capacity\_reservation\_resource\_group\_arn | `string` | `null` | no |
| <a name="input_capacity_reservation_target"></a> [capacity\_reservation\_target](#input\_capacity\_reservation\_target) | block supports the following : capacity\_reservation\_id - (Optional) ,capacity\_reservation\_resource\_group\_arn - (Optional) | `map(string)` | `{}` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | common tags for all resources ec2, ebs storage , root block storage | `map(string)` | n/a | yes |
| <a name="input_cpu_core_count"></a> [cpu\_core\_count](#input\_cpu\_core\_count) | Sets the number of CPU cores for an instance. This option is only supported on creation of instance type that support CPU Options CPU Cores and Threads Per CPU Core Per Instance Type - specifying this option for unsupported instance types will return an error from the EC2 API | `number` | `null` | no |
| <a name="input_cpu_threads_per_core"></a> [cpu\_threads\_per\_core](#input\_cpu\_threads\_per\_core) | has no effect unless cpu\_core\_count is also set) If set to to 1, hyperthreading is disabled on the launched instance. Defaults to 2 if not set. | `number` | `null` | no |
| <a name="input_credit_specification_cpu_credits"></a> [credit\_specification\_cpu\_credits](#input\_credit\_specification\_cpu\_credits) | Configuration block for customizing the credit specification of the instance.  Credit option for CPU usage. Valid values include standard or unlimited. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default | `string` | `"standard"` | no |
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | If true, enables EC2 Instance Termination Protection. | `bool` | n/a | yes |
| <a name="input_e2_associate_public_ip_address"></a> [e2\_associate\_public\_ip\_address](#input\_e2\_associate\_public\_ip\_address) | Whether to associate a public IP address with an instance in a VPC | `string` | `null` | no |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | If true, the launched EC2 instance will be EBS-optimized. Note that if this is not set on an instance type that is optimized by default then this will show as disabled but if the instance type is optimized by default then there is no need to set this and there is no effect to disabling it | `bool` | `true` | no |
| <a name="input_ec2_data_replace_on_change"></a> [ec2\_data\_replace\_on\_change](#input\_ec2\_data\_replace\_on\_change) | When used in combination with user\_data or user\_data\_base64 will trigger a destroy and recreate when set to true. | `bool` | n/a | yes |
| <a name="input_ec2_ebs_device"></a> [ec2\_ebs\_device](#input\_ec2\_ebs\_device) | list of map for ebs storage | <pre>list(object({<br>    device_name = string<br>    tags        = map(string)<br>    volume_size = string<br>    volume_type = string<br>  }))</pre> | <pre>[<br>  {<br>    "device_name": "/dev/xvdb",<br>    "tags": {<br>      "FileSystem": "/web/data"<br>    },<br>    "volume_size": "10",<br>    "volume_type": "gp3"<br>  }<br>]</pre> | no |
| <a name="input_ec2_key_name"></a> [ec2\_key\_name](#input\_ec2\_key\_name) | Key name of the Key Pair to use for the instance; which can be managed using the aws\_key\_pair resource | `string` | n/a | yes |
| <a name="input_ec2_sg_ids"></a> [ec2\_sg\_ids](#input\_ec2\_sg\_ids) | A list of security group IDs to associate with | `list(string)` | n/a | yes |
| <a name="input_ec2_tags"></a> [ec2\_tags](#input\_ec2\_tags) | ec2 resource specific tags | `map(string)` | `{}` | no |
| <a name="input_ec2_user_data"></a> [ec2\_user\_data](#input\_ec2\_user\_data) | User data to provide when launching the instance. Do not pass gzip-compressed data via this argument. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user\_data\_replace\_on\_change is set then updates to this field will trigger a destroy and recreate | `string` | n/a | yes |
| <a name="input_enable_template"></a> [enable\_template](#input\_enable\_template) | Set true to enable launch template | `bool` | `false` | no |
| <a name="input_enclave_options_enabled"></a> [enclave\_options\_enabled](#input\_enclave\_options\_enabled) | Enable Nitro Enclaves on launched instances. | `bool` | `false` | no |
| <a name="input_ephemeral_block_device"></a> [ephemeral\_block\_device](#input\_ephemeral\_block\_device) | One or more configuration blocks to customize Ephemeral (also known as 'Instance Store') volumes on the instance | <pre>list(object({<br>    device_name  = string<br>    no_device    = bool<br>    virtual_name = string<br>  }))</pre> | `[]` | no |
| <a name="input_hibernation"></a> [hibernation](#input\_hibernation) | If true, the launched EC2 instance will support hibernation | `bool` | `true` | no |
| <a name="input_host_id"></a> [host\_id](#input\_host\_id) | ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host. | `string` | `null` | no |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the | `string` | `null` | no |
| <a name="input_instanceType"></a> [instanceType](#input\_instanceType) | Type of instance | `string` | n/a | yes |
| <a name="input_instance_initiated_shutdown_behavior"></a> [instance\_initiated\_shutdown\_behavior](#input\_instance\_initiated\_shutdown\_behavior) | Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances | `string` | n/a | yes |
| <a name="input_ipv6_address_count"></a> [ipv6\_address\_count](#input\_ipv6\_address\_count) | Number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet | `number` | `null` | no |
| <a name="input_launch_template"></a> [launch\_template](#input\_launch\_template) | Specifies a Launch Template to configure the instance | <pre>object({<br>    id      = string<br>    version = string<br>  })</pre> | `null` | no |
| <a name="input_maintenance_options"></a> [maintenance\_options](#input\_maintenance\_options) | Maintenance and recovery options for the instance.Can be 'default' or 'disabled' | <pre>object({<br>    auto_recovery = string<br>  })</pre> | `null` | no |
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | If true, the launched EC2 instance will have detailed monitoring enabled | `bool` | `true` | no |
| <a name="input_most_recent_ami"></a> [most\_recent\_ami](#input\_most\_recent\_ami) | If more than one result is returned, use the most recent AMI | `bool` | `true` | no |
| <a name="input_owner_ami"></a> [owner\_ami](#input\_owner\_ami) | List of AMI owners to limit search. Valid values: an AWS account ID, self (the current account), or an AWS owner alias (e.g., amazon, aws-marketplace, microsoft) | `list(string)` | n/a | yes |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | Private IP address to associate with the instance in a VPC | `string` | n/a | yes |
| <a name="input_root_block_device"></a> [root\_block\_device](#input\_root\_block\_device) | Configuration block to customize details about the root block device of the instance | <pre>list(object({<br>    root_volume_type = string<br>    root_volume_size = string<br>    root_volume_tags = map(string)<br>  }))</pre> | <pre>[<br>  {<br>    "root_volume_size": "30",<br>    "root_volume_tags": {<br>      "FileSystem": "/root"<br>    },<br>    "root_volume_type": "gp3"<br>  }<br>]</pre> | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | VPC Subnet ID to launch in | `string` | n/a | yes |
| <a name="input_tenancy"></a> [tenancy](#input\_tenancy) | Tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware. The host tenancy is not supported for the import-instance command. Valid values are default, dedicated, and host | `string` | `"default"` | no |
| <a name="input_user_data_base64"></a> [user\_data\_base64](#input\_user\_data\_base64) | Can be used instead of user\_data to pass base64-encoded binary data directly. Use this instead of user\_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user\_data\_replace\_on\_change is set then updates to this field will trigger a destroy and recreate. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_instance_arn"></a> [aws\_instance\_arn](#output\_aws\_instance\_arn) | ARN of the instance |
| <a name="output_aws_instance_outpost_arn"></a> [aws\_instance\_outpost\_arn](#output\_aws\_instance\_outpost\_arn) | ARN of the Outpost the instance is assigned to. |
| <a name="output_aws_instance_private_dns"></a> [aws\_instance\_private\_dns](#output\_aws\_instance\_private\_dns) | Private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC |
| <a name="output_aws_instance_state"></a> [aws\_instance\_state](#output\_aws\_instance\_state) | State of the instance. One of: pending, running, shutting-down, terminated, stopping, stopped |
| <a name="output_ec2_primary_network_interface_id"></a> [ec2\_primary\_network\_interface\_id](#output\_ec2\_primary\_network\_interface\_id) | ID of the instance's primary network interface |
| <a name="output_ec2_vpc_id"></a> [ec2\_vpc\_id](#output\_ec2\_vpc\_id) | vpc id of the subnet associated with ec2 |

## Usage as Modules

| Name                                                                     | Source                                                 | Version |
|--------------------------------------------------------------------------|--------------------------------------------------------|---------|
| <a name="module_ec2_linux"></a> [sg\_ec2_linux](#module\_sg\_ec2\_linux) | ../../Modules/Compute/Creation of EC2 Instance (Linux) | n/a |

``` 
module "ec2" {
  source = "../../../Modules/Compute/Creation of EC2 Instance (Linux)"

  instanceType                         = var.instanceType
  e2_associate_public_ip_address       = var.e2_associate_public_ip_address
  ec2_sg_ids                           = var.ec2_sg_ids
  subnet_id                            = var.subnet_id
  private_ip                           = var.private_ip
  ec2_key_name                         = var.ec2_key_name
  ec2_user_data                        = var.ec2_user_data
  ec2_data_replace_on_change           = var.ec2_data_replace_on_change
  availability_zone                    = var.availability_zone
  cpu_core_count                       = var.cpu_core_count
  cpu_threads_per_core                 = var.cpu_threads_per_core
  disable_api_termination              = var.disable_api_termination
  ebs_optimized                        = var.ebs_optimized
  hibernation                          = var.hibernation
  host_id                              = var.host_id
  iam_instance_profile                 = var.iam_instance_profile
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  ipv6_address_count                   = var.ipv6_address_count
  monitoring                           = var.monitoring
  tenancy                              = var.tenancy
  enable_template                      = var.enable_template
  launch_template                      = var.launch_template
  capacity_reservation_specification   = var.capacity_reservation_specification
  capacity_reservation_target          = var.capacity_reservation_target
  credit_specification_cpu_credits     = var.credit_specification_cpu_credits
  enclave_options_enabled              = var.enclave_options_enabled
  ephemeral_block_device               = var.ephemeral_block_device
  common_tags                          = var.common_tags
  maintenance_options                  = var.maintenance_options
  ec2_tags                             = var.ec2_tags
  root_block_device                    = var.root_block_device
  ec2_ebs_device                       = var.ec2_ebs_device
  most_recent_ami                      = var.most_recent_ami
  owner_ami                            = var.owner_ami
  ami_filter                           = var.ami_filter

}

```