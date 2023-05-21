#---------------------------DynamoDB DAX Cluster---------------------------#
### DAX Cluster creation
# Create DAX Subnet Group
resource "aws_dax_subnet_group" "dax_subnet_group" {
  name       = var.cluster_name
  subnet_ids = var.subnet_ids
  description = "Create the subnet group to be associated with the DAX cluster"
}
# Create DAX Subnet Group
resource "aws_dax_parameter_group" "dax_parameter_group" {
    name = var.cluster_name
    description = "Create the parameter group to be associated with the DAX cluster"
    parameters {
        name  = "query-ttl-millis"
        value = var.query_ttl
    }

    parameters {
        name  = "record-ttl-millis"
        value = var.record_ttl
    }
}

# Create DAX Cluster
resource "aws_dax_cluster" "dax_cluster" {
    cluster_name                        = var.cluster_name
    iam_role_arn                        = var.iam_role_arn
    node_type                           = var.node_type
    replication_factor                  = var.node_count
    server_side_encryption {
        enabled = var.server_side_encryption
    }
    parameter_group_name                = aws_dax_parameter_group.dax_parameter_group.name
    subnet_group_name                   = aws_dax_subnet_group.dax_subnet_group.name
    maintenance_window                  = var.maintenance_window
    security_group_ids                  = var.security_group_ids
    cluster_endpoint_encryption_type    = var.cluster_endpoint_encryption_type
    availability_zones                  = var.availability_zones
    notification_topic_arn              = var.notification_topic_arn
    tags                                = var.tags 
}

