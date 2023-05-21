# Introduction
Amazon Elastic Block Store (EBS) provides raw block-level storage that can be attached to Amazon EC2 instances and is used by Amazon Relational Database Service (RDS). Amazon EBS provides a range of options for storage performance and cost. An EBS snapshot is a point-in-time copy of your Amazon EBS volume, which is lazily copied to Amazon Simple Storage Service (Amazon S3). This module helps in creating multiple ebs volumes and their snapshots(if required).

## Prerequisites

1. A KMS Key ID passed as input, should be valid and exsist in AWS Console
2. If value for optional parameter snapshot_id is passed, then the snapshot id must be valid and exist in AWS Console.

## Requirements

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.55.0 |
| <a name="terraform"></a> [terraform](#provider\terraform) | >=1.3.6 |


## Resources

| Name | Type |
|------|------|
| [aws_ebs_snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_snapshot) | resource |
| [aws_ebs_volume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_ebs_snapshot"></a> [create\_ebs\_snapshot](#input\_create\_ebs\_snapshot) | To specify whether or not to create snapshots for the volumes. | `bool` | `false` | no |
| <a name="input_ebs_snapshot"></a> [ebs\_snapshot](#input\_ebs\_snapshot) | A configuration block that defines required and optional arguments for the creation of ebs snapshots. | <pre>list(object({<br>    description            = optional(string, null) # A description of what the snapshot is.<br>    outpost_arn            = optional(string, null) # The Amazon Resource Name (ARN) of the Outpost on which to create a local snapshot.<br>    storage_tier           = optional(string, null) # The name of the storage tier. Valid values are archive and standard. Default value is standard.<br>    permanent_restore      = optional(string, false) # Indicates whether to permanently restore an archived snapshot.<br>    temporary_restore_days = optional(string, null) #Specifies the number of days for which to temporarily restore an archived snapshot. Required for temporary restores only.<br>    tags                   = map(string) # A map of tags to assign to the snapshot.<br>  }))</pre> | `[]` | no |
| <a name="input_ebs_volumes"></a> [ebs\_volumes](#input\_ebs\_volumes) | A configuration block that defines required and optional arguments for the creation of ebs volumes. | <pre>list(object({<br>    availability_zone    = string #(Required) The AZ where the EBS volume will exist.<br>    size                 = optional(number, null) #The size of the drive in GiBs.<br>    type                 = optional(string, null) #The type of EBS volume. Can be standard, gp2, gp3, io1, io2, sc1 or st1<br>    final_snapshot       = optional(string, false) #If true, snapshot will be created before volume deletion.<br>    iops                 = optional(number, null) #The amount of IOPS to provision for the disk. Only valid for type of io1, io2 or gp3.<br>    multi_attach_enabled = optional(string, false) #pecifies whether to enable Amazon EBS Multi-Attach. Multi-Attach is supported on io1 and io2 volumes.<br>    snapshot_id          = optional(string, null) #A snapshot to base the EBS volume off of.<br>    encrypted            = optional(string, false) #If true, the disk will be encrypted.<br>    kms_key_id           = optional(string, null) #The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true.<br>    throughput           = optional(number, null) #The throughput that the volume supports, in MiB/s. Only valid for type of gp3.<br>    tag                  = map(string) #A map of tags to assign to the resource.<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ebs_snapshot_arn"></a> [ebs\_snapshot\_arn](#output\_ebs\_snapshot\_arn) | ARN of the created ebs snapshot |
| <a name="output_ebs_volume_arn"></a> [ebs\_volume\_arn](#output\_ebs\_volume\_arn) | ARN of the created ebs module |

## Modules

```
module "ebs_volume_and_snapshot" {
  source              = "../modules"

 #--------------------------------------Input values related to EBS Volume resource-------------------------------------------------#

ebs_volumes = [{
  availability_zone    = "us-west-2a"
  encrypted            = true
  final_snapshot       = true
  iops                 = 300
  kms_key_id           = "arn:aws:kms:us-west-2:239312700453:key/fb6d4575-c173-4bb9-be40-524285cc65a6"
  multi_attach_enabled = true
  size                 = 40
  snapshot_id          = "snap-0fe13540bbb0d8041"
  tag = {
    Name     = "Develop"
    "Backup" = "true"
  }
  throughput = 150
  type       = "io1"
  },
  {
    availability_zone    = "us-west-2a"
    encrypted            = true
    final_snapshot       = true
    iops                 = 300
    kms_key_id           = "arn:aws:kms:us-west-2:239312700453:key/fb6d4575-c173-4bb9-be40-524285cc65a6"
    multi_attach_enabled = false
    size                 = 40
    snapshot_id          = "snap-0fe13540bbb0d8041"
    tag = {
      Name     = "Develop"
      "Backup" = "true"
    }
    throughput = 150
    type       = "gp3"
}]

#--------------------------------------Input values related to EBS Snapshot resource-------------------------------------------------#

create_ebs_snapshot = true

ebs_snapshot = [{
  description = "Demo Snapshot"
  //outpost_arn = "arn:aws:outposts:us-west-2:239312700453:outpost/op-0cf0c39a6ad19dc24"
  permanent_restore = false
  storage_tier      = "standard"
  tags = {
    name     = "Develop-snap"
    "Backup" = "true"
  }
  temporary_restore_days = 1
  },
  {
    description = "Demo Snapshot"
    // outpost_arn       = "arn:aws:outposts:us-west-2:239312700453:outpost/op-0cf0c39a6ad19dc24"
    permanent_restore = false
    storage_tier      = "standard"
    tags = {
      name     = "Develop-snap"
      "Backup" = "true"
    }
    temporary_restore_days = 1
}]
}

```

<!-- END_TF_DOCS -->