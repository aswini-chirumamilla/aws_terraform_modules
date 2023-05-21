aws_profile                    = "Terraform"
aws_region                     = "us-west-1"
#iam_role_arn                  = "arn:aws:iam::239312700453:role/service-role/KinesisFirehoseServiceRole-KDS-S3-9hi1v-us-west-1-1676301011520"
log_destination                = "arn:aws:firehose:us-west-1:239312700453:deliverystream/kinesis_firehose_test"
traffic_type                   = "ALL"
vpc_id                         = "vpc-0200516497d973ddd"
log_destination_type           = "kinesis-data-firehose"
max_aggregation_interval       = 60
file_format                    = "parquet"
hive_compatible_partitions     = true
per_hour_partition             = true
#eni_id                        = "eni-0dda324d5f356cef9"
#subnet_id                     = "subnet-0bad549f74ae2cba4"
#transit_gateway_id            = "tgw-0828eb522bbcecbca"
#transit_gateway_attachment_id = "tgw-attach-0dc3868a3335e47fb"

tags = {
  Name = "vpcflowlogs"
}
