module "S3" {
  source = "../../../Modules/Storage/S3"

s3_bucket_name      = var.s3_bucket_name
bucket_prefix       = var.bucket_prefix
force_destroy       = var.force_destroy
object_lock_enabled = var.object_lock_enabled

#--------------S3 Bucket Accelerate Configuration-------------------------------------------------------#

expected_bucket_owner_accelerate_config = var.expected_bucket_owner_accelerate_config
bucket_accelerate_status                = var.bucket_accelerate_status

#--------------S3 Bucket ACL----------------------------------------------------------------------------#

s3_bucket_acl                    = var.s3_bucket_acl
expected_bucket_owner_bucket_acl = var.expected_bucket_owner_bucket_acl

#--------------S3 Bucket Cors Configuration-------------------------------------------------------------#

enable_s3_bucket_cors_configuration = var.enable_s3_bucket_cors_configuration
expected_bucket_owner_cors_config   = var.expected_bucket_owner_cors_config
cors_rule                           = var.cors_rule

#--------------S3 bucket lifecycle configuration--------------------------------------------------------#

enable_s3_bucket_lifecycle_configuration = var.enable_s3_bucket_lifecycle_configuration
s3_lifecycle_configuration_rule          = var.s3_lifecycle_configuration_rule

#--------------S3 Bucket Logging------------------------------------------------------------------------#

target_bucket            = var.target_bucket
target_prefix            = var.target_prefix

#---------------S3 Bucket Policy------------------------------------------------------------------------#

s3policy_filepath       = var.s3policy_filepath

#--------------S3 Bucket Replication Configuration-------------------------------------------------------#

enable_s3_bucket_replication_configuration = var.enable_s3_bucket_replication_configuration
role                                       = var.role
replication_configuration_token            = var.replication_configuration_token
replication_configuration_rule             = var.replication_configuration_rule

#--------------S3 Bucket Request Payment Configuration--------------------------------------------------#

expected_bucket_owner_payment_config           = var.expected_bucket_owner_payment_config
payer                                          = var.payer

#--------------S3 Bucket Server Side Encryption Configuration-------------------------------------------#

enable_s3_bucket_server_side_encryption_configuration = var.enable_s3_bucket_server_side_encryption_configuration
expected_bucket_owner_server_side_encryption_config   = var.expected_bucket_owner_server_side_encryption_config
server_side_encryption_configuration_rule             = var.server_side_encryption_configuration_rule

#-------------S3 Bucket Versioning----------------------------------------------------------------------#

enable_s3_bucket_versioning             = var.enable_s3_bucket_versioning 
expected_bucket_owner_bucket_versioning = var.expected_bucket_owner_bucket_versioning
bucket_versioning_mfa                   = var.bucket_versioning_mfa
versioning_configuration                = var.versioning_configuration

#--------------Tags-------------------------------------------------------------------------------------#

tags = var.tags

}