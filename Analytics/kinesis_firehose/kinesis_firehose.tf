#######      Extended S3 Destination     #########
resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  name        = var.extended_s3_stream
  destination = var.destination_S3
  tags        = var.tags
  
 
  
  s3_configuration {

    role_arn           = var.role_arn
    bucket_arn         = var.bucket_arn
    prefix             = var.prefix
    compression_format = var.compression_format
    buffer_size        = var.buffer_size
    buffer_interval    = var.buffer_interval
    
  }
}

#####    Extended S3 Destination with dynamic partitioning  ######


resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream_dynamic" {
  name        = var.extended_s3_stream_dynamic
  destination = var.destination_S3_dynamic
  tags = var.tags
  dynamic_partitioning_configuration {
    
      enabled = var.dynamic_partitioning_configuration_enabled
      prefix              = var.prefix
      error_output_prefix = var.error_output_prefix
  }

  dynamic "extended_s3_configuration" {
    for_each = var.extended_s3_configuration != null ? [1] : []
    content {
      role_arn   = var.role_arn
      bucket_arn = var.bucket_arn 
      buffer_size = var.buffer_size
    }
  }
  


    
    
    processing_configuration {
      enabled = var.processing_configuration_enabled 
      processors {
        type = var.type
        parameters {
          parameter_name  = var.parameter_name
          parameter_value = var.parameter_value
        }
      }

    }
}

##### Redshift Destination #####

resource "aws_kinesis_firehose_delivery_stream" "redshift" {
  name        = var.redshift
  destination = var.destination_redshift

  s3_configuration {
    role_arn           = var.role_arn
    bucket_arn         = var.bucket_arn
    buffer_size        = var.buffer_size
    buffer_interval    = var.buffer_interval
    compression_format = var.compression_format
  }

  redshift_configuration {
    role_arn           = var.role_arn 
    cluster_jdbcurl    = var.cluster_jdbcurl
    username           = var.username
    password           = var.password
    data_table_name    = var.data_table_name
    copy_options       = var.copy_options
    data_table_columns = var.data_table_columns
    s3_backup_mode     = var.s3_backup_mode

    s3_backup_configuration {
      role_arn           = var.role_arn  
      bucket_arn         = var.bucket_arn
      buffer_size        = var.buffer_size
      buffer_interval    = var.buffer_interval
      compression_format = var.compression_format
    }
  }
}

### Elasticsearch Destination With VPC ####
resource "aws_kinesis_firehose_delivery_stream" "elasticsearch" {
  

  name        = var.elasticsearch
  destination = var.destination_elasticsearch
  s3_configuration {
    role_arn   = var.role_arn
    bucket_arn = var.bucket_arn
  }
  elasticsearch_configuration {
    domain_arn = var.domain_arn
    role_arn   = var.role_arn
    index_name = var.index_name
    type_name  = var.type_name

    vpc_config {
      subnet_ids         = var.subnet_ids
      security_group_ids = var.security_group_ids
      role_arn           = var.role_arn 
    }
  }
}
  #### HTTP Endpoint (e.g., New Relic) Destination ###

  resource "aws_kinesis_firehose_delivery_stream" "HTTP_endpoint" {
  name        = var.HTTP_endpoint
  destination = var.destination_HTTP

  s3_configuration {
    role_arn           = var.role_arn
    bucket_arn         = var.bucket_arn
    buffer_size        = var.buffer_size
    buffer_interval    = var.buffer_interval
    compression_format = var.compression_format
  }

  http_endpoint_configuration {
    url                = var.url
    name               = var.http_endpoint_configuration
    access_key         = var.access_key
    buffering_size     = var.buffering_size
    buffering_interval = var.buffering_interval
    role_arn           = var.role_arn
    s3_backup_mode     = var.s3_backup_mode

    request_configuration {
      content_encoding = var.content_encoding

      common_attributes {
        name  = var.common_attributes
        value = var.value
      }

      common_attributes {
        name  = var.common_attributes_1
        value = var.value_1
      }
    }
  }
}


     

      
      






  
