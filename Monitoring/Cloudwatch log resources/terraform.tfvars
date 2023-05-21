#providers

aws_region  = "ap-south-1"
aws_profile = "default"

#Cloudwatch Log

log_group_name          = "eycilcwloggroup3"
retention_in_days       = 14
kms_key_id              = null
cw_log_destination_name = "test_destination"
cw_log_role_arn         = "arn:aws:iam::239312700453:role/eycilkinesisdes"
cw_log_target_arn       = "arn:aws:kinesis:ap-south-1:239312700453:stream/eycilkinesisdest1"
filter_name             = "cloudwatch metric filter"
pattern                 = "ERROR"
metric_name             = "Error_count"
metric_value            = "1"
metric_unit             = "Seconds"
namespace               = "namespaceey"
tags = {
  "env" : "prod"
}
log_stream_name        = "eycilcwlogstream3"
subs_name              = "eysubscwlog1"
cw_log_role_arn_subs   = "arn:aws:iam::239312700453:role/eycilkinesisdes"
subs_pattern           = "ERROR"
cw_log_target_arn_subs = "arn:aws:kinesis:ap-south-1:239312700453:stream/eycilkinesisdest1"
distribution           = "Random"