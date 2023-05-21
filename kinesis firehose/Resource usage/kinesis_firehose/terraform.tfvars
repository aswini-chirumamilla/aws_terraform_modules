aws_region  = "us-east-1"
aws_profile = "Aswini"

extended_s3_configuration = [{

  role_arn   = "arn:aws:iam::239312700453:role/firehose_delivery_cilrole"
  bucket_arn = "arn:aws:s3:::cilbucket675"
  dynamic_partitioning_configuration = [{
     enabled             = false
           retry_duration = 300
   }]

  processing_configuration = [{
    enabled = false
    processors = [{
      type = "RecordDeAggregation"
      parameters = [{
        parameter_name = "SubRecordType"

        parameter_value = "JSON"
      }]
    }]
  }]

}]
redshift_name        = "redshift"
destination_redshift = "redshift"
s3_configuration = [{

  role_arn   = "arn:aws:iam::239312700453:role/firehose_delivery_cilrole"
  bucket_arn = "arn:aws:s3:::cilbucket675"
}]
redshift_configuration = [{


  role_arn                = "arn:aws:iam::239312700453:role/firehose_delivery_cilrole"
  cluster_jdbcurl         = "jdbc:redshift://redshift-cluster-1.c5xw8y0fjqkh.us-east-1.redshift.amazonaws.com:5439/dev"
  username                = "cilfirehose"
  password                = "cilfirehose"
  data_table_name         = "cilfirehose"
  s3_backup_mode = "Enabled"

  s3_backup_configuration = [{

    role_arn   = "arn:aws:iam::239312700453:role/firehose_delivery_cilrole"
    bucket_arn = "arn:aws:s3:::cilbucket675"
  }]
}]


elasticsearch_configuration = [{

  domain_arn = "arn:aws:es:us-east-1:239312700453:domain/cilfirehose"
  role_arn   = "arn:aws:iam::239312700453:role/firehose_delivery_cilrole"
  index_name = "cilfirehose"
  vpc_config = [{
    subnet_ids         = ["subnet-008454d8c7f3ffd57", "subnet-07addbb764b2be328"]
    security_group_ids = ["sg-0ac793ad770851d49", "sg-0ae5b82dad6e325ac"]
    role_arn           = ["sg-0ac793ad770851d49", "sg-0ae5b82dad6e325ac"]
  }]
}]


http_endpoint_configuration = [ {

  url      = "https://aws-api.newrelic.com/firehose/v1"
  role_arn = "arn:aws:iam::239312700453:role/firehose_delivery_cilrole"
  request_configuration = [ {
   content_encoding = null 
   common_attributes = [ {
    name     = "cilcommonattributes"
}]
}]

}]
tags = {
  "destination" = "kinesis_firehose_delivery"
}



  
  
  
  
  






