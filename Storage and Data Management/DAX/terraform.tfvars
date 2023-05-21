    availability_zones               = ["us-west-2c", "us-west-2b"]
    cluster-name                     = "test_dax"
    cluster_endpoint_encryption_type = "TLS"
    iam_role_arn                     = "arn:aws:iam::239312700453:role/DAX_dynamoDB"
    maintenance_window               = "sun:08:00-sun:12:00"
    node_count                       = 2
    node_type                        = "dax.t2.small"
    notification_topic_arn           = "arn:aws:iam::239312700453:role/SNS_for_DAX"
    query_ttl                        = "300000"
    record_ttl                       = "300000"
    security_group_ids               = ["sg-03455c68b5acd0446", "sg-0abacbf19f4fac376"]
    server_side_encryption           = true
    subnet_ids                       = ["subnet-0860766f6f5764cfb", "subnet-0c44cc0354fb5380a"]
    tags = {
        "CreatedBy": "Terraform",
        "Environment": "Testing",
        "name": "P03_Sachin",
        "owner": "",
        "pid": "P03",
        "prj-name": "AWS GDS CIL Team"
    }
