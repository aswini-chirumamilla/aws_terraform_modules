table_name                              = "DB_1"
capacity_mode                           = "PAY_PER_REQUEST"
attributes                              = [{name = "UserId"
                                            type = "S"},
                                            {name = "key2"
                                            type = "S"}]
partition_key                           = "UserId"
sort_key                                = "key2"
read_capacity                           = 0
write_capacity                          = 0
point_in_time_recovery_enabled          = true
global_secondary_indexes                = [{
                                            name                = "Key2Index"
                                            hash_key            = "UserId"
                                            range_key           = "key2"
                                            projection_type     = "INCLUDE"
                                            non_key_attributes  = ["id"]
                                            write_capacity      = 5
                                            read_capacity       = 5 }]    
local_secondary_indexes                 = []

ttl_attribute_name                      = "TimeToExist"
ttl_enabled                             = false

stream_enabled_dynamodb                 = false
stream_view_type_dynamodb               = "NEW_AND_OLD_IMAGES"
server_side_encryption_enabled          = true
server_side_encryption_kms_key_arn      = "arn:aws:kms:us-west-2:239312700453:key/7ee6502a-1dd7-4ff1-beeb-e1962f3abfd8"
autoscaling_enabled                     = false
autoscaling_defaults                    = { scale_in_cooldown  = 0
                                            scale_out_cooldown = 0
                                            target_value       = 70 }
autoscaling_read                        = { scale_in_cooldown  = 60
                                            scale_out_cooldown = 60
                                            target_value       = 30
                                            max_capacity       = 5 }
autoscaling_write                       = { scale_in_cooldown  = 60
                                            scale_out_cooldown = 60
                                            target_value       = 30
                                            max_capacity       = 5 }
autoscaling_indexes                     = { Key2Index = {
                                            read_max_capacity  = 30
                                            read_min_capacity  = 10
                                            write_max_capacity = 30
                                            write_min_capacity = 10 }}
table_class                             = "STANDARD"
tags                                    = { "CreatedBy"   = "Terraform"
                                            "Environment" = "Testing"
                                            "name"        = "P03_Sachin"
                                            "pid"         = "P03"
                                            "prj-name"    = "AWS GDS CIL Team"
                                            "owner"       = "sachin.padasali@gds.ey.com"}
replica_regions                         = [{
                                            region_name            = "ap-south-1"
                                            kms_key_arn            = "arn:aws:kms:ap-south-1:239312700453:key/0d3f0046-542a-40bf-81b1-6d916adb3424"
                                            propagate_tags         = true
                                            point_in_time_recovery = true }]