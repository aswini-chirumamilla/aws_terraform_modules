# module athena database

resource "aws_athena_database" "database" {
  for_each = var.athena_database != null ? var.athena_database : {}
  name     = each.key
  bucket   = lookup(each.value, "bucket")
  dynamic "acl_configuration" {
    for_each = lookup(each.value, "acl_configuration") != null ? lookup(each.value, "acl_configuration") : []
    content {
      s3_acl_option = acl_configuration.value.s3_acl_option
    }
  }
  comment = lookup(each.value, "comment")
  dynamic "encryption_configuration" {
    for_each = lookup(each.value, "encryption_configuration") != null ? lookup(each.value, "encryption_configuration") : []
    content {
      encryption_option = encryption_configuration.value.encryption_option
      kms_key           = encryption_configuration.value.kms_key
    }
  }
  expected_bucket_owner = lookup(each.value, "expected_bucket_owner")
  force_destroy         = lookup(each.value, "force_destroy")
  properties            = lookup(each.value, "properties")
}



# module athena workgroup

resource "aws_athena_workgroup" "workgroup" {
  for_each = var.athena_workgroup != null ? var.athena_workgroup : {}
  name     = lookup(each.value, "name")

  dynamic "configuration" {
    for_each = lookup(each.value, "configuration") != null ? lookup(each.value, "configuration") : []
    content {
      bytes_scanned_cutoff_per_query  = configuration.value.bytes_scanned_cutoff_per_query
      enforce_workgroup_configuration = configuration.value.enforce_workgroup_configuration
      dynamic "engine_version" {
        for_each = configuration.value.engine_version != null ? configuration.value.engine_version : []
        content {
          selected_engine_version = engine_version.value.selected_engine_version
        }
      }
      execution_role                     = configuration.value.execution_role
      publish_cloudwatch_metrics_enabled = configuration.value.publish_cloudwatch_metrics_enabled
      dynamic "result_configuration" {
        for_each = configuration.value.result_configuration != null ? configuration.value.result_configuration : []
        content {
          dynamic "encryption_configuration" {
            for_each = result_configuration.value.encryption_configuration != null ? result_configuration.value.encryption_configuration : []
            content {
              encryption_option = encryption_configuration.value.encryption_option
              kms_key_arn       = encryption_configuration.value.kms_key_arn
            }
          }
          dynamic "acl_configuration" {
            for_each = result_configuration.value.acl_configuration != null ? result_configuration.value.acl_configuration : []
            content {
              s3_acl_option = acl_configuration.value.s3_acl_option
            }
          }
          expected_bucket_owner = result_configuration.value.expected_bucket_owner
          output_location       = result_configuration.value.output_location
        }
      }
      requester_pays_enabled = configuration.value.requester_pays_enabled
    }
  }
}

# module athena named query


resource "aws_athena_named_query" "named_query" {
  for_each    = var.athena_named_query != null ? var.athena_named_query : {}
  name        = lookup(each.value, "name")
  workgroup   = lookup(each.value, "workgroup")
  database    = lookup(each.value, "database")
  query       = lookup(each.value, "query")
  description = lookup(each.value, "description")
  depends_on = [
    aws_athena_workgroup.workgroup
  ]
}