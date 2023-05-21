variable "aws_region" {
  description = "AWS_Region"
  type        = string
}

variable "aws_profile" {
  description = "AWS_profile"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group. If omitted, Terraform will assign a random, unique name"
  type        = string
}

variable "sg_tags" {
  description = "Map of tags to assign to the resource"
  type        = map(string)
}

variable "sg_vpcid" {
  description = "VPC ID. Defaults to the region's default VPC."
  type        = string
}

variable "sg_description" {
  description = "Security group description. Defaults to Managed by Terraform. Cannot be ''(empty string). NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags "
  type        = string
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
}

variable "revoke_rules_on_delete" {
  description = " Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first. Default false"
  default     = false
  type        = bool
}

variable "sg_ingress" {
  description = "Configuration block for ingress rules. The following arguments are required: from_port, to_port, protocol, cidr_blocks, description, ipv6_cidr_blocks, prefix_list_ids, security_groups, self "
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    description      = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    self             = bool
  }))
}

variable "sg_egress" {
  description = ""
  default = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = ""
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    description      = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    self             = bool
  }))
}