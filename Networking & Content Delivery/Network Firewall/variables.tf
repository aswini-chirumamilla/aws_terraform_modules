# AWS Network Firewall resource Variables
variable "firewall_name" {
  description = "The descriptive name of the Network Firewall."
  type        = string
}

variable "firewall_description" {
  description = "A description of the Network Firewall."
  type        = string
}

variable "kms_key_alias_name" {
  description = "Provide Alias name for Customer Managed KMS Key for encryption of Network Firewall. Provide the null value for using the default AWS-managed KMS encryption."
  type        = string
  default     = null
}

variable "firewall_policy_arn" {
  description = "The Amazon Resource Name (ARN) of the firewall policy. The relationship of firewall to firewall policy is many to one. Each firewall requires one firewall policy association, and you can use the same firewall policy for multiple firewalls."
  type        = string
}

variable "firewall_vpc_id" {
  description = "The unique identifier of the VPC where AWS Network Firewall should create the firewall."
  type        = string
}

variable "firewall_subnets" {
  description = "Set of configuration blocks describing the public subnets. Each subnet must belong to a different Availability Zone in the VPC. AWS Network Firewall creates a firewall endpoint in each subnet."
  type        = list(any)
}

variable "firewall_policy_change_protection" {
  description = "A setting indicating whether the firewall is protected against a change to the firewall policy association. Use this setting to protect against accidentally modifying the firewall policy for a firewall that is in use."
  type        = bool
  default     = true
}

variable "firewall_subnet_change_protection" {
  description = "A setting indicating whether the firewall is protected against changes to the subnet associations. Use this setting to protect against accidentally modifying the subnet associations for a firewall that is in use."
  type        = bool
  default     = true
}

variable "firewall_delete_protection" {
  description = "A flag indicating whether it is possible to delete the firewall. A setting of TRUE indicates that the firewall is protected against deletion. Use this setting to protect against accidentally deleting a firewall that is in use."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Map of resource tags to associate with the Network Firewall resource."
  type        = map(string)
}