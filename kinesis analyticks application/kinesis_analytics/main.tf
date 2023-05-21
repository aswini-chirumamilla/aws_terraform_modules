#######     cloud watch log group  ##########

resource "aws_cloudwatch_log_group" "log_group" {
  name = var.log_group
}

#######     cloud watch log stream   ##########

resource "aws_cloudwatch_log_stream" "log_stream" {
  name           = var.log_stream
  log_group_name = aws_cloudwatch_log_group.log_group.name
}

#####    kinesis analytics application   #######

resource "aws_kinesis_analytics_application" "kinesis_analytics" {
  name                  = var.kinesis_analytics
  code                  = var.code
  description           = var.description
  start_application     = var.start_application
  tags                  = var.tags
  dynamic "cloudwatch_logging_options" {
    for_each = var.cloudwatch_logging_options
    content {
      log_stream_arn = aws_cloudwatch_log_stream.log_stream.arn
      role_arn       = cloudwatch_logging_options.value.role_arn
    }
  }
  dynamic "inputs" {
    for_each = var.inputs
    content {
      name_prefix = inputs.value.name_prefix
      schema {
        record_columns {
          record_columns    = inputs.value.record_columns
          record_format  = inputs.value.record_format 
          record_encoding = inputs.value.record_encoding
        }
      }
      dynamic "kinesis_firehose" {
        for_each = var.kinesis_firehose
        content{
            resource_arn = kinesis_firehose.value.resource_arn
            role_arn     = kinesis_firehose.value.role_arn
        }
      }
      dynamic "kinesis_stream" {
        for_each = var.kinesis_stream
        content{
            resource_arn = kinesis_stream.value.resource_arn
            role_arn     = kinesis_stream.value.role_arn
        }
      }
      dynamic "parallelism"{
        for_each = var.parallelism
        content{
            count  = parallelism.value.count
        }
      }
      dynamic "processing_configuration"{
        for_each = var.processing_configuration
        content{
          lambda {
            resource_arn = processing_configuration.value.resource_arn
            role_arn = processing_configuration.value.role_arn
          }
        }
      }
      dynamic "starting_position_configuration" {
        for_each = var.starting_position_configuration
        content{
            starting_position = var.starting_position
        }
      }
    }
  }
  dynamic "outputs" {
    for_each = var.outputs
    content {
      name = outputs.value.name
      schema {
      record_format_type = outputs.value.record_format_type
      }
      dynamic "kinesis_firehose" {
        for_each = var.kinesis_firehose
        content{
            resource_arn = kinesis_firehose.value.resource_arn
            role_arn     = kinesis_firehose.value.role_arn
        }
      }
      dynamic "kinesis_stream" {
        for_each = var.kinesis_stream
        content{
            resource_arn = kinesis_stream.value.resource_arn
            role_arn     = kinesis_stream.value.role_arn
        }
      }
      dynamic "lambda" {
          for_each = var.lambda
          content{
            resource_arn  = lambda.value.resource_arn 
            role_arn = lambda.value.role_arn
      }
      }
  }
    #   record_format {
    #     mapping_parameters {
    #       csv {
    #         record_column_delimiter = inputs.value.record_column_delimiter
    #         record_row_delimiter    = inputs.value.record_row_delimiter
    #       }
    #     }
    #   }
    # }

      
      
      

    
  }
    }
    

    

      
  dynamic "reference_data_sources"{
    for_each = var.reference_data_sources
    content{
        table_name = var.table_name
      schema {

      }
      dynamic "s3 "{
        bucket_arn = var.bucket_arn
        file_key  = var.file_key 
        role_arn  = var.role_arn 

      }

    }
  }

  

  
  
}