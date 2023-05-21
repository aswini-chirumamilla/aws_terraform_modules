#######      Extended S3 Destination     #########

resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  count       = (var.extended_s3_stream != null && var.destination_S3 != null) ? 1 : 0
  name        = var.extended_s3_stream
  destination = var.destination_S3
  tags        = var.tags
  dynamic "extended_s3_configuration" {
    for_each = var.extended_s3_configuration
    content {
      role_arn    = extended_s3_configuration.value.role_arn
      bucket_arn  = extended_s3_configuration.value.bucket_arn
      buffer_size = extended_s3_configuration.value.buffer_size
      dynamic "processing_configuration" {
        for_each = extended_s3_configuration.value.processing_configuration
        content {
          enabled = processing_configuration.value.enabled
          dynamic "processors" {
            for_each = processing_configuration.value.processors
            content {
              type = processors.value.type
              dynamic "parameters" {
                for_each = processors.value.parameters
                content {
                  parameter_name  = parameters.value.parameter_name
                  parameter_value = parameters.value.parameter_value
                }

              }

            }
          }
        }
      }
    }
  }
}

######    Redshift destination #######

resource "aws_kinesis_firehose_delivery_stream" "redshift" {
  count       = (var.redshift_name != null && var.destination_redshift != null) ? 1 : 0
  name        = var.redshift_name
  destination = var.destination_redshift
  dynamic "s3_configuration" {
    for_each = var.s3_configuration
    content {
      role_arn           = s3_configuration.value.role_arn
      bucket_arn         = s3_configuration.value.bucket_arn
      buffer_size        = s3_configuration.value.buffer_size
      buffer_interval    = s3_configuration.value.buffer_interval
      compression_format = s3_configuration.value.compression_format
    }
  }
  dynamic "redshift_configuration" {
    for_each = var.redshift_configuration
    content {
      role_arn           = redshift_configuration.value.role_arn
      cluster_jdbcurl    = redshift_configuration.value.cluster_jdbcurl
      username           = redshift_configuration.value.username
      password           = redshift_configuration.value.password
      data_table_name    = redshift_configuration.value.data_table_name
      copy_options       = redshift_configuration.value.copy_options
      data_table_columns = redshift_configuration.value.data_table_columns
      s3_backup_mode     = redshift_configuration.value.s3_backup_mode
      dynamic "s3_backup_configuration" {
        for_each = redshift_configuration.value.s3_backup_configuration
        content {
          role_arn           = s3_backup_configuration.value.role_arn
          bucket_arn         = s3_backup_configuration.value.bucket_arn
          buffer_size        = s3_backup_configuration.value.buffer_size
          buffer_interval    = s3_backup_configuration.value.buffer_interval
          compression_format = s3_backup_configuration.value.compression_format
        }
      }
    }
  }
}

#####    Extended S3 Destination with dynamic partitioning  ######

resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream_dynamic" {
  count       = (var.extended_s3_stream_dynamic != null && var.destination_S3_dynamic != null) ? 1 : 0
  name        = var.extended_s3_stream_dynamic
  destination = var.destination_S3_dynamic
  tags        = var.tags
  dynamic "extended_s3_configuration" {
    for_each = var.extended_s3_configuration
    content {
      role_arn    = extended_s3_configuration.value.role_arn
      bucket_arn  = extended_s3_configuration.value.bucket_arn
      buffer_size = extended_s3_configuration.value.buffer_size
      dynamic "dynamic_partitioning_configuration" {
        for_each = extended_s3_configuration.value.dynamic_partitioning_configuration
        content {
          enabled        = dynamic_partitioning_configuration.value.enabled
          retry_duration = dynamic_partitioning_configuration.value.retry_duration
        }
      }
      dynamic "processing_configuration" {
        for_each = extended_s3_configuration.value.processing_configuration
        content {
          enabled = processing_configuration.value.enabled
          dynamic "processors" {
            for_each = processing_configuration.value.processors
            content {
              type = processors.value.type
              parameters {
                parameter_name  = processors.value.parameter_name
                parameter_value = processors.value.parameter_value
              }
            }
          }
        }
      }
    }
  }
}

### Elasticsearch Destination With VPC ####

resource "aws_kinesis_firehose_delivery_stream" "elasticsearch" {
  count       = (var.elasticsearch_name != null && var.destination_elasticsearch != null) ? 1 : 0
  name        = var.elasticsearch_name
  destination = var.destination_elasticsearch
  tags        = var.tags
  dynamic "s3_configuration" {
    for_each = var.s3_configuration
    content {
      role_arn   = s3_configuration.value.role_arn
      bucket_arn = s3_configuration.value.bucket_arn
    }
  }
  dynamic "elasticsearch_configuration" {
    for_each = var.elasticsearch_configuration
    content {
      domain_arn = elasticsearch_configuration.value.domain_arn
      role_arn   = elasticsearch_configuration.value.role_arn
      index_name = elasticsearch_configuration.value.index_name
      type_name  = elasticsearch_configuration.value.type_name
      dynamic "vpc_config" {
        for_each = elasticsearch_configuration.value.vpc_config
        content {
          subnet_ids         = vpc_config.value.subnet_ids
          security_group_ids = vpc_config.value.security_group_id
          role_arn           = vpc_config.value.role_arn
        }
      }
    }
  }
}

#### HTTP Endpoint (e.g., New Relic) Destination ###

resource "aws_kinesis_firehose_delivery_stream" "HTTP_endpoint" {
  count       = (var.HTTP_endpoint_name != null && var.destination_HTTP != null) ? 1 : 0
  name        = var.HTTP_endpoint_name
  destination = var.destination_HTTP
  tags        = var.tags
  dynamic "s3_configuration" {
    for_each = var.s3_configuration
    content {
      role_arn           = s3_configuration.value.role_arn
      bucket_arn         = s3_configuration.value.bucket_arn
      buffer_size        = s3_configuration.value.buffer_size
      buffer_interval    = s3_configuration.value.buffer_interval
      compression_format = s3_configuration.value.compression_format
    }
  }
  dynamic "http_endpoint_configuration" {
    for_each = var.http_endpoint_configuration
    content {
      url                = http_endpoint_configuration.value.url
      name               = http_endpoint_configuration.value.http_endpoint_configuration
      access_key         = http_endpoint_configuration.value.access_key
      buffering_size     = http_endpoint_configuration.value.buffering_size
      buffering_interval = http_endpoint_configuration.value.buffering_interval
      role_arn           = http_endpoint_configuration.value.role_arn
      s3_backup_mode     = http_endpoint_configuration.value.s3_backup_mode
      retry_duration     = http_endpoint_configuration.value.retry_duration
      dynamic "request_configuration" {
        for_each = http_endpoint_configuration.value.request_configuration
        content {
          content_encoding = request_configuration.value.content_encoding
          dynamic "common_attributes" {
            for_each = request_configuration.value.common_attributes
            content {
              name  = common_attributes.value.name
              value = common_attributes.value.value
            }
          }
        }
      }
    }
  }
}





















