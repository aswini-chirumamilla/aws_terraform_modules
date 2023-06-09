## Introduction 

Amazon Simple Storage Service (Amazon S3) is an object storage service that offers industry-leading scalability, data availability, security, and performance. Customers of all sizes and industries can use Amazon S3 to store and protect any amount of data for a range of use cases, such as data lakes, websites, mobile applications, backup and restore, archive, enterprise applications, IoT devices, and big data analytics.

## Pre-requisites

1. The file for parameter s3policy_filepath should exist and consist of valid policy for the S3 bucket
2. IAM Role ARN being passed as input role parameter in S3 Bucket replication configuration should be valid and exist in the AWS console.
3. Destination bucket should be valid and exist in AWS Console, for which the ARN is being passed as input.
4. KMS Key ID being passed as input for S3 replication , should be valid and exist in AWS console.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) |  1.3.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.54.0 |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_accelerate_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_accelerate_configuration) | resource |
| [aws_s3_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_cors_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_replication_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_replication_configuration) | resource |
| [aws_s3_bucket_request_payment_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_request_payment_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_accelerate_status"></a> [bucket\_accelerate\_status](#input\_bucket\_accelerate\_status) | The transfer acceleration state of the bucket. Valid values: Enabled, Suspended. | `string` | `null` | no |
| <a name="input_bucket_prefix"></a> [bucket\_prefix](#input\_bucket\_prefix) | Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. Must be lowercase and less than or equal to 37 characters in length. | `string` | `null` | no |
| <a name="input_bucket_versioning_mfa"></a> [bucket\_versioning\_mfa](#input\_bucket\_versioning\_mfa) | (Optional, Required if versioning\_configuration mfa\_delete is enabled) The concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device. Value for this parameter should be entered only if proper input value is provided for versioning\_configuration | `string` | `null` | no |
| <a name="input_cors_rule"></a> [cors\_rule](#input\_cors\_rule) | Configuration block for CORS RULE | <pre>list(object({<br>    allowed_methods = list(string)           # Valid values are GET, PUT, HEAD, POST, and DELETE<br>    allowed_origins = list(string)           # (Required) Set of origins you want customers to be able to access the bucket from.<br>    allowed_headers = optional(list(string)) # (Optional) Set of Headers that are specified in the Access-Control-Request-Headers header.<br>    expose_headers  = optional(list(string)) # (Optional) Set of headers in the response that you want customers to be able to access from their applications (for example, from a JavaScript XMLHttpRequest object).<br>    cors_rule_id    = optional(string, null) # (Optional) Unique identifier for the rule. The value cannot be longer than 255 characters.<br>    max_age_seconds = optional(number, null) #  (Optional) The time in seconds that your browser is to cache the preflight response for the specified resource.<br>  }))</pre> | `[]` | no |
| <a name="input_enable_s3_bucket_cors_configuration"></a> [enable\_s3\_bucket\_cors\_configuration](#input\_enable\_s3\_bucket\_cors\_configuration) | Whether or not to enable CORS configuration | `bool` | `false` | no |
| <a name="input_enable_s3_bucket_lifecycle_configuration"></a> [enable\_s3\_bucket\_lifecycle\_configuration](#input\_enable\_s3\_bucket\_lifecycle\_configuration) | Whether or not to enable CORS configuration | `bool` | `false` | no |
| <a name="input_enable_s3_bucket_replication_configuration"></a> [enable\_s3\_bucket\_replication\_configuration](#input\_enable\_s3\_bucket\_replication\_configuration) | Whether or not to enable s3 bucket replication configuration | `bool` | `false` | no |
| <a name="input_enable_s3_bucket_server_side_encryption_configuration"></a> [enable\_s3\_bucket\_server\_side\_encryption\_configuration](#input\_enable\_s3\_bucket\_server\_side\_encryption\_configuration) | Whether or not to enable s3 bucket server side encryption configuration | `bool` | `false` | no |
| <a name="input_enable_s3_bucket_versioning"></a> [enable\_s3\_bucket\_versioning](#input\_enable\_s3\_bucket\_versioning) | Whether or not to enable s3 bucket versioning | `bool` | `false` | no |
| <a name="input_expected_bucket_owner_accelerate_config"></a> [expected\_bucket\_owner\_accelerate\_config](#input\_expected\_bucket\_owner\_accelerate\_config) | (Forces new resource) The account ID of the expected bucket owner. | `string` | `null` | no |
| <a name="input_expected_bucket_owner_bucket_acl"></a> [expected\_bucket\_owner\_bucket\_acl](#input\_expected\_bucket\_owner\_bucket\_acl) | (Forces new resource) The account ID of the expected bucket owner. Value for this parameter should be entered only if proper input value is provided for s3\_bucket\_acl | `string` | `null` | no |
| <a name="input_expected_bucket_owner_bucket_logging"></a> [expected\_bucket\_owner\_bucket\_logging](#input\_expected\_bucket\_owner\_bucket\_logging) | (Forces new resource) The account ID of the expected bucket owner. Value for this parameter should be entered only if proper input value is provided for target\_bucket and target\_prefix | `string` | `null` | no |
| <a name="input_expected_bucket_owner_bucket_versioning"></a> [expected\_bucket\_owner\_bucket\_versioning](#input\_expected\_bucket\_owner\_bucket\_versioning) | (Forces new resource) The account ID of the expected bucket owner. Value for this parameter should be entered only if proper input value is provided for versioning\_configuration | `string` | `null` | no |
| <a name="input_expected_bucket_owner_cors_config"></a> [expected\_bucket\_owner\_cors\_config](#input\_expected\_bucket\_owner\_cors\_config) | (Forces new resource) The account ID of the expected bucket owner. Value for this parameter should be entered only if proper input value is provided for cors\_rule | `string` | `null` | no |
| <a name="input_expected_bucket_owner_payment_config"></a> [expected\_bucket\_owner\_payment\_config](#input\_expected\_bucket\_owner\_payment\_config) | (Forces new resource) The account ID of the expected bucket owner. Value for this parameter should be entered only if proper input value is provided for payer | `string` | `null` | no |
| <a name="input_expected_bucket_owner_server_side_encryption_config"></a> [expected\_bucket\_owner\_server\_side\_encryption\_config](#input\_expected\_bucket\_owner\_server\_side\_encryption\_config) | (Forces new resource) The account ID of the expected bucket owner. Value for this parameter should be entered only if proper input value is provided for server\_side\_configuration\_rule | `string` | `null` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | A boolean that indicates all objects (including any locked objects) should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. These objects are not recoverable. This only deletes objects when the bucket is destroyed, not when setting this parameter to true | `bool` | `false` | no |
| <a name="input_object_lock_enabled"></a> [object\_lock\_enabled](#input\_object\_lock\_enabled) | Whether or not to enable object lock | `bool` | `false` | no |
| <a name="input_payer"></a> [payer](#input\_payer) | Specifies who pays for the download and request fees. Valid values: BucketOwner, Requester | `string` | `null` | no |
| <a name="input_replication_configuration_rule"></a> [replication\_configuration\_rule](#input\_replication\_configuration\_rule) | (Required) List of configuration blocks describing the rules managing the replication | <pre>list(object({<br>    destination = list(object({<br>      destination_bucket = string                 # (Required) The Amazon Resource Name (ARN) of the bucket where you want Amazon S3 to store the results.<br>      account            = optional(string, null) # (Optional) The Account ID to specify the replica ownership. Must be used in conjunction with access_control_translation override configuration.<br>      storage_class      = optional(string, null) # (Optional) The storage class used to store the object. By default, Amazon S3 uses the storage class of the source object to create the object replica.<br>      access_control_translation = optional(list(object({<br>        owner = string # (Required) Specifies the replica ownership. For default and valid values, see PUT bucket replication in the Amazon S3 API Reference. Valid values: Destination.<br>      })))<br>      encryption_configuration = optional(list(object({<br>        replica_kms_key_id = string # (Required) The ID (Key ARN or Alias ARN) of the customer managed AWS KMS key stored in AWS Key Management Service (KMS) for the destination bucket<br>      })))<br>      metrics = optional(list(object({<br>        metrics_status = string # (Required) The status of the Destination Metrics. Either "Enabled" or "Disabled".<br>        event_threshold = optional(list(object({<br>          event_threshold_minutes = number # (Required) Time in minutes. Valid values: 15.<br>        })))<br>      })))<br>      replication_time = optional(list(object({<br>        replication_time_status = string # (Required) The status of the Replication Time Control. Either "Enabled" or "Disabled".<br>        time = list(object({             # (Required) A configuration block specifying the time by which replication should be complete for all objects and operations on objects<br>          replication_minutes = number   # (Required) Time in minutes. Valid values: 15<br>        }))<br>      })))<br>    }))<br>    replication_configuration_rule_status = string # (Required) The status of the rule. Either "Enabled" or "Disabled". The rule is ignored if status is not "Enabled".<br>    delete_marker_replication = optional(list(object({<br>      delete_marker_replication_status = string # (Required) Whether delete markers should be replicated. Either "Enabled" or "Disabled"<br>    })))<br>    existing_object_replication = optional(list(object({<br>      existing_object_replication_status = string # (Required) Whether the existing objects should be replicated. Either "Enabled" or "Disabled".<br>    })))<br>    id       = optional(string, null) # (Optional) Unique identifier for the rule. Must be less than or equal to 255 characters in length<br>    priority = optional(number, null) # (Optional) The priority associated with the rule. Priority should only be set if filter is configured. If not provided, defaults to 0. Priority must be unique between multiple rules.<br>    source_selection_criteria = optional(list(object({<br>      replica_modifications = optional(list(object({<br>        replica_modifications_status = string # (Required) Whether the existing objects should be replicated. Either "Enabled" or "Disabled".<br>      })))<br>      sse_kms_encrypted_objects = optional(list(object({<br>        sse_kms_encrypted_objects_status = string # (Required) Whether the existing objects should be replicated. Either "Enabled" or "Disabled".<br>      })))<br>    })))<br>    filter = optional(list(object({<br>      and = optional(list(object({<br>        and_prefix = optional(string, null) # (Optional) An object key name prefix that identifies subset of objects to which the rule applies. Must be less than or equal to 1024 characters in length.<br>        and_tags   = optional(map(string))  # (Optional, Required if prefix is configured) A map of tags (key and value pairs) that identifies a subset of objects to which the rule applies. The rule applies only to objects having all the tags in its tagset.<br>      })))<br>      prefix = string # (Optional) An object key name prefix that identifies subset of objects to which the rule applies. Must be less than or equal to 1024 characters in length.<br>      tag = optional(list(object({<br>        tag_key   = string # (Required) Name of the object key.<br>        tag_value = string # (Required) Value of the tag.<br>      })))<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_replication_configuration_token"></a> [replication\_configuration\_token](#input\_replication\_configuration\_token) | A token to allow replication to be enabled on an Object Lock-enabled bucket. You must contact AWS support for the bucket's Object Lock token. Value for this parameter should not be entered until proper input value is provided for role and replication\_configuration\_rule | `string` | `null` | no |
| <a name="input_role"></a> [role](#input\_role) | The ARN of the IAM role for Amazon S3 to assume when replicating the objects | `string` | `null` | no |
| <a name="input_s3_bucket_acl"></a> [s3\_bucket\_acl](#input\_s3\_bucket\_acl) | The canned ACL to apply to the bucket. Valid Calues : 'private', 'public-read' , 'public-read-write', 'aws-exec-read', 'authenticated-read', 'bucket-owner-read', 'bucket-owner-full-control' or 'log-delivery-write'. | `string` | `null` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | The name of S3 bucket | `string` | `null` | no |
| <a name="input_s3_lifecycle_configuration_rule"></a> [s3\_lifecycle\_configuration\_rule](#input\_s3\_lifecycle\_configuration\_rule) | An S3 Lifecycle configuration is a block consists of one or more Lifecycle rules. Each rule consists of the following: 1.Rule metadata (id and status).  2.Filter identifying objects to which the rule applies. 3.One or more transition or expiration actions. | <pre>list(object({<br>    id = string<br>    expiration = optional(list(object({<br>      days = number # (Optional) The lifetime, in days, of the objects that are subject to the rule. The value must be a non-zero positive integer.<br>    })))<br>    status = string # (Required) Whether the rule is currently being applied. Valid values: Enabled or Disabled.<br>    filter = optional(list(object({<br>      object_size_greater_than = optional(number, null) # (Optional) Minimum object size (in bytes) to which the rule applies.<br>      object_size_less_than    = optional(number, null) # (Optional) Maximum object size (in bytes) to which the rule applies.<br>      prefix                   = optional(string, null) # (Optional) Prefix identifying one or more objects to which the rule applies. Defaults to an empty string ("") if not specified.<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_s3policy_filepath"></a> [s3policy\_filepath](#input\_s3policy\_filepath) | S3 policy file | `string` | `null` | no |
| <a name="input_server_side_encryption_configuration_rule"></a> [server\_side\_encryption\_configuration\_rule](#input\_server\_side\_encryption\_configuration\_rule) | Rule block for server side encryption configuration | <pre>list(object({<br>    bucket_key_enabled = optional(bool, false)<br>    apply_server_side_encryption_by_default = optional(list(object({<br>      sse_algorithm     = string<br>      kms_master_key_id = optional(string, null)<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | common tags for all resources | `map(string)` | n/a | yes |
| <a name="input_target_bucket"></a> [target\_bucket](#input\_target\_bucket) | The name of the bucket where you want Amazon S3 to store server access logs. | `string` | `null` | no |
| <a name="input_target_prefix"></a> [target\_prefix](#input\_target\_prefix) | A prefix for all log object keys. | `string` | `null` | no |
| <a name="input_versioning_configuration"></a> [versioning\_configuration](#input\_versioning\_configuration) | Configuration block for versioning of s3 bucket | <pre>list(object({<br>    versioning_status = string<br>    mfa_delete        = optional(string, null)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | ARN of the S3 bucket |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | ID of the S3 bucket |

## Modules

```
module "S3" {
  source = "../../../Modules/Storage/S3"
  
#--------------Creation of S3 Bucket variables----------------------------------------------------------#

s3_bucket_name      = "terraform-bucket-for-aws-cil-v2b"
bucket_prefix       = "config-"
force_destroy       = false
object_lock_enabled = false

#--------------S3 Bucket Accelerate Configuration-------------------------------------------------------#

expected_bucket_owner_accelerate_config = "051171442365"
bucket_accelerate_status                = "Enabled"

#--------------S3 Bucket ACL----------------------------------------------------------------------------#

expected_bucket_owner_bucket_acl = "051171442365"
s3_bucket_acl                    = "private"

#--------------S3 Bucket Cors Configuration-------------------------------------------------------------#

enable_s3_bucket_cors_configuration = true
expected_bucket_owner_cors_config   = "051171442365"
cors_rule                           = [{
    allowed_methods = ["PUT", "POST"]                     
    allowed_origins = ["https://s3-website-test.hashicorp.com"]                     
    allowed_headers = ["*"]           
    expose_headers  = ["ETag"]                           
    max_age_seconds = 3000
}]

#--------------S3 bucket lifecycle configuration--------------------------------------------------------#

enable_s3_bucket_lifecycle_configuration = true
s3_lifecycle_configuration_rule          = [{
    id = "config"
    expiration = [{
        days = 2
    }]
    status = "Enabled"
    filter = [{
      object_size_greater_than = 0
      object_size_less_than    = 100
      prefix                   = "config/"
    }]
}]

#--------------S3 Bucket Logging------------------------------------------------------------------------#

expected_bucket_owner_bucket_logging = "051171442365"
target_bucket                        = "terraform-bucket-for-aws-cil-v2b"
target_prefix                        = "terraform"

#---------------S3 Bucket Policy------------------------------------------------------------------------#

s3policy_filepath       = "s3policy.json"

#--------------S3 Bucket Replication Confiuration-------------------------------------------------------#

enable_s3_bucket_replication_configuration = false
role                                       = "arn:aws:iam::051171442365:role/tf-s3-replication-role"
replication_configuration_rule             = [{
    destination = [{
        destination_bucket = "arn:aws:s3:::terraform-replication-destination"
        account            = "051171442365"
        storage_class      = "STANDARD"
      access_control_translation = [{
        owner = "Destination"
      }]
      encryption_configuration = [{
        replica_kms_key_id = "arn:aws:kms:us-east-1:051171442365:key/90889bc2-8cbf-403c-b7c4-45bc775d3cf6"
      }]
      metrics                  = [{
        metrics_status = "Enabled"
        event_threshold = [{
            event_threshold_minutes = 15
        }]
      }]
      replication_time         = [{
        replication_time_status = "Enabled"
        time = [{
            replication_minutes = 15
        }]
      }]
    }]
    replication_configuration_rule_status = "Enabled"
    delete_marker_replication             = [{
        delete_marker_replication_status = "Enabled"
    }]
    existing_object_replication           = [{
        existing_object_replication_status = "Enabled"
    }]
    id                                    = "S3id"
    priority                              = 1
    source_selection_criteria             = [{
        replica_modifications = [{
            replica_modifications_status = "Enabled"
        }]
        sse_kms_encrypted_objects = [{
            sse_kms_encrypted_objects_status = "Enabled"
        }]
    }]
    filter                                = [{
        prefix = "terra-"
    }]
}]

#--------------S3 Bucket Request Payment Configuration--------------------------------------------------#

expected_bucket_owner_payment_config           = "051171442365"
payer                                          = "BucketOwner"

#--------------S3 Bucket Server Side Encryption Configuration-------------------------------------------#

enable_s3_bucket_server_side_encryption_configuration = false
expected_bucket_owner_server_side_encryption_config   = "051171442365"
server_side_encryption_configuration_rule             = [{
    bucket_key_enabled = true
    apply_server_side_encryption_by_default = [{
        sse_algorithm    = "aws:kms"
        kms_master_key_id = null
    }]
}]

#-------------S3 Bucket Versioning ---------------------------------------------------------------------#

enable_s3_bucket_versioning             = true
expected_bucket_owner_bucket_versioning = "051171442365"
versioning_configuration                = [{
    versioning_status = "Enabled"
}]

#--------------Tags-------------------------------------------------------------------------------------#

tags = {
    environment = "Development"
    module      = "S3"
}

}
```