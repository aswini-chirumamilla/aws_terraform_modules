#-------------Provider----------------------------------------------------------------------------------#

aws_region  = "us-east-1"
aws_profile = "terraform-user"

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