variable "cluster_name" {
    type        = string
    description = "Name of Cluster"
}

variable "subnet_ids" {
    type        = list(string)
    description = "List of Subnets in which the Cluster Group will be attached"
}

variable "query_ttl" {
    type        = string
    description = "Query Time To Live in milliseconds"
    default     = "300000"
}

variable "record_ttl" {
    type        = string
    description = "Record Time To Live in milliseconds"
    default     = "300000"
}

variable "iam_role_arn" {
    type        = string
    description = "ARN that identifies an IAM role that needs to be attached to the cluster"
}


variable "node_type" {
    type        = string
    description = "VM type for the cluster machines. Currently only t and r type nodes are allowed as node type for the cluster"
}

variable "node_count" {
    type        = number
    description = "The number of nodes in the DAX cluster. If 1 then it will create a single-node cluster, without any read replicas"
    default     = 1
}

variable "maintenance_window" {
    type        = string
    description = "Specifies the weekly time range for when maintenance on the cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period"
    default     = "sun:08:00-sun:12:00"
}

variable "security_group_ids" {
    type        = list(string)
    description = "One or more VPC security groups to be associated with the cluster"
}

variable "server_side_encryption" {
    type        = bool
    description = "Encrypt at rest options"
    default     = true
}

variable "cluster_endpoint_encryption_type" {
    type        = string
    description = "The type of encryption the cluster's endpoint should support. Valid values are NONE and TLS"
    default     = "TLS"
}

variable "availability_zones" {
    type        = list(string)
    description = "List of Availability Zones in which the nodes will be created" 
    default     = [] 
}

variable "notification_topic_arn" {
    type        = string
    description = "ARN of an SNS topic to send DAX notifications to"
    default = null
}

variable "tags" {
    description = "Tags to be associated to the DynamoDB table"
    type        = map(string)
    default     = {
      "CreatedBy"   = "Terraform"
      "Environment" = "Testing"
      "name"        = "P03_Sachin"
      "pid"         = "P03"
      "prj-name"    = "AWS GDS CIL Team"
      "owner"       = ""
    }
}