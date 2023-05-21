#--------------Creation of S3 Bucket-----------------------------------------------------------#

resource "aws_s3_bucket" "create_s3_bucket" {
  bucket              = var.s3_bucket_name
  bucket_prefix       = local.bucket_prefix
  force_destroy       = var.force_destroy
  tags                = var.tags
  object_lock_enabled = var.object_lock_enabled
}

#--------------S3 Bucket Accelerate Configuration----------------------------------------------#

resource "aws_s3_bucket_accelerate_configuration" "bucket_accelerate_configuration" {
  count                 = var.bucket_accelerate_status != null ? 1 : 0
  bucket                = aws_s3_bucket.create_s3_bucket.bucket
  expected_bucket_owner = var.expected_bucket_owner_accelerate_config
  status                = var.bucket_accelerate_status
}

#--------------S3 Bucket ACL-------------------------------------------------------------------#

resource "aws_s3_bucket_acl" "bucket_acl" {
  count                 = var.s3_bucket_acl != null ? 1 : 0
  bucket                = aws_s3_bucket.create_s3_bucket.bucket
  acl                   = var.s3_bucket_acl
  expected_bucket_owner = var.expected_bucket_owner_bucket_acl
}

#--------------S3 Bucket Cors Configuration------------------------------------------------------#

resource "aws_s3_bucket_cors_configuration" "s3_cors_configuration" {
  count                 = var.enable_s3_bucket_cors_configuration ? 1 : 0
  bucket                = aws_s3_bucket.create_s3_bucket.bucket
  expected_bucket_owner = var.expected_bucket_owner_cors_config
  dynamic "cors_rule" {
    for_each = var.cors_rule
    content {
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      allowed_headers = cors_rule.value.allowed_headers
      expose_headers  = cors_rule.value.expose_headers
      id              = cors_rule.value.cors_rule_id
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }
}

#--------------S3 bucket lifecycle configuration--------------------------------------------------#

resource "aws_s3_bucket_lifecycle_configuration" "s3_lifecycle_configuration" {
  count  = var.enable_s3_bucket_lifecycle_configuration ? 1 : 0
  bucket = aws_s3_bucket.create_s3_bucket.bucket
  dynamic "rule" {
    for_each = var.s3_lifecycle_configuration_rule
    content {
      id = rule.value.id
      dynamic "expiration" {
        for_each = rule.value.expiration
        content {
          days = expiration.value.days
        }
      }
      status = rule.value.status
      dynamic "filter" {
        for_each = rule.value.filter
        content {
          object_size_greater_than = filter.value.object_size_greater_than
          object_size_less_than    = filter.value.object_size_less_than
          prefix                   = filter.value.prefix
        }
      }
    }
  }
}
#--------------S3 Bucket Logging----------------------------------------------------------------#

resource "aws_s3_bucket_logging" "s3_bucket_logging" {
  count         = (var.target_bucket != null && var.target_prefix != null) ? 1 : 0
  bucket        = aws_s3_bucket.create_s3_bucket.bucket
  target_bucket = var.target_bucket
  target_prefix = var.target_prefix
}

#---------------S3 Bucket Policy--------------------------------------------------------------------#

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  count  = var.s3policy_filepath != null ? 1 : 0
  bucket = aws_s3_bucket.create_s3_bucket.bucket
  policy = file("${var.s3policy_filepath}")
}

#--------------S3 Bucket Replication Configuration---------------------------------------------------#

resource "aws_s3_bucket_replication_configuration" "s3_bucket_replication_configuration" {
  count  = var.enable_s3_bucket_replication_configuration ? 1 : 0
  bucket = aws_s3_bucket.create_s3_bucket.bucket
  role   = var.role
  token  = var.replication_configuration_token
  dynamic "rule" {
    for_each = var.replication_configuration_rule
    content {
      dynamic "destination" {
        for_each = rule.value.destination
        content {
          bucket        = destination.value.destination_bucket
          account       = destination.value.account
          storage_class = destination.value.storage_class
          dynamic "access_control_translation" {
            for_each = destination.value.access_control_translation
            content {
              owner = access_control_translation.value.owner
            }
          }
          dynamic "encryption_configuration" {
            for_each = destination.value.encryption_configuration
            content {
              replica_kms_key_id = encryption_configuration.value.replica_kms_key_id
            }
          }
          dynamic "metrics" {
            for_each = destination.value.metrics
            content {
              status = metrics.value.metrics_status
              dynamic "event_threshold" {
                for_each = metrics.value.event_threshold
                content {
                  minutes = event_threshold.value.event_threshold_minutes
                }
              }
            }
          }
          dynamic "replication_time" {
            for_each = destination.value.replication_time
            content {
              status = replication_time.value.replication_time_status
              dynamic "time" {
                for_each = replication_time.value.time
                content {
                  minutes = time.value.replication_minutes
                }
              }
            }
          }
        }
      }
      status = rule.value.replication_configuration_rule_status
      dynamic "delete_marker_replication" {
        for_each = rule.value.delete_marker_replication
        content {
          status = delete_marker_replication.value.delete_marker_replication_status
        }
      }
      dynamic "existing_object_replication" {
        for_each = rule.value.existing_object_replication
        content {
          status = existing_object_replication.value.existing_object_replication_status
        }
      }
      id       = rule.value.id
      priority = rule.value.priority
      dynamic "source_selection_criteria" {
        for_each = rule.value.source_selection_criteria
        content {
          dynamic "replica_modifications" {
            for_each = source_selection_criteria.value.replica_modifications
            content {
              status = replica_modifications.value.replica_modifications_status
            }
          }
          dynamic "sse_kms_encrypted_objects" {
            for_each = source_selection_criteria.value.sse_kms_encrypted_objects
            content {
              status = sse_kms_encrypted_objects.value.sse_kms_encrypted_objects_status
            }
          }
        }
      }
      dynamic "filter" {
        for_each = rule.value.filter
        content {
          dynamic "and" {
            for_each = lookup(filter.value, "and", [])
            content {
              prefix = and.value.and_prefix
              tags   = and.value.and_tags
            }
          }
          prefix = lookup(filter.value, "prefix")
          dynamic "tag" {
            for_each = lookup(filter.value, "tag", [])
            content {
              key   = tag.value.tag_key
              value = tag.value.tag_value
            }
          }
        }
      }
    }
  }
}

#--------------S3 Bucket Request Payment Configuration--------------------------------------------#

resource "aws_s3_bucket_request_payment_configuration" "request_payment_configuration" {
  count                 = var.payer != null ? 1 : 0
  bucket                = aws_s3_bucket.create_s3_bucket.bucket
  expected_bucket_owner = var.expected_bucket_owner_payment_config
  payer                 = var.payer
}

#--------------S3 Bucket Server Side Encryption Configuration--------------------------------------#

resource "aws_s3_bucket_server_side_encryption_configuration" "server_side_encryption_configuration" {
  count                 = var.enable_s3_bucket_server_side_encryption_configuration ? 1 : 0
  bucket                = aws_s3_bucket.create_s3_bucket.bucket
  expected_bucket_owner = var.expected_bucket_owner_server_side_encryption_config
  dynamic "rule" {
    for_each = var.server_side_encryption_configuration_rule
    content {
      bucket_key_enabled = rule.value.bucket_key_enabled
      dynamic "apply_server_side_encryption_by_default" {
        for_each = rule.value.apply_server_side_encryption_by_default
        content {
          sse_algorithm     = apply_server_side_encryption_by_default.value.sse_algorithm
          kms_master_key_id = apply_server_side_encryption_by_default.value.kms_master_key_id
        }
      }
    }
  }
}

#-------------S3 Bucket Versioning ---------------------------------------------------------------#

resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  count                 = var.enable_s3_bucket_versioning ? 1 : 0
  bucket                = aws_s3_bucket.create_s3_bucket.bucket
  expected_bucket_owner = var.expected_bucket_owner_bucket_versioning
  mfa                   = var.bucket_versioning_mfa
  dynamic "versioning_configuration" {
    for_each = var.versioning_configuration
    content {
      status     = versioning_configuration.value.versioning_status
      mfa_delete = versioning_configuration.value.mfa_delete
    }
  }
}

#----------------------locals block-----------------------------------------

locals {
  bucket_prefix = (var.s3_bucket_name == null ? var.bucket_prefix : null)
}