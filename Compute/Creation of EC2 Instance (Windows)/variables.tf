variable "region" {
  description = " Name of region "
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "Name of profile"
  type        = string
  default     = "terraform-rishi-aws"
}

variable "most_recent_ami" {
  description = "If more than one result is returned, use the most recent AMI"
  default     = true
  type        = bool
}

variable "owner_ami" {
  description = "List of AMI owners to limit search. Valid values: an AWS account ID, self (the current account), or an AWS owner alias (e.g., amazon, aws-marketplace, microsoft)"
  type        = list(string)
}

variable "ami_filter" {
  description = "One or more name/value pairs to filter off of"
  type = list(object({
    name   = string
    values = list(string)
  }))
}

variable "instanceType" {
  description = "Type of instance"
  type        = list(string)
}

variable "ec2_sg_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string) # ["ID"] Security Group ID will come here if include module is set to false
}

variable "ec2_user_data" {
  description = " User data to provide when launching the instance. Do not pass gzip-compressed data via this argument. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user_data_replace_on_change is set then updates to this field will trigger a destroy and recreate"
  type        = string
}

variable "user_data_base64" {
  description = "Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user_data_replace_on_change is set then updates to this field will trigger a destroy and recreate."
  default     = null
  type        = string
}

variable "ec2_data_replace_on_change" {
  description = "When used in combination with user_data or user_data_base64 will trigger a destroy and recreate when set to true."
  type        = bool
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  default     = ""
  type        = string
}

variable "cpu_core_count" {
  description = "Sets the number of CPU cores for an instance. This option is only supported on creation of instance type that support CPU Options CPU Cores and Threads Per CPU Core Per Instance Type - specifying this option for unsupported instance types will return an error from the EC2 API"
  default     = null
  type        = number
}

variable "cpu_threads_per_core" {
  description = "has no effect unless cpu_core_count is also set) If set to to 1, hyperthreading is disabled on the launched instance. Defaults to 2 if not set."
  default     = null
  type        = number
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection."
  type        = bool
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized. Note that if this is not set on an instance type that is optimized by default then this will show as disabled but if the instance type is optimized by default then there is no need to set this and there is no effect to disabling it"
  default     = true
  type        = bool
}

variable "hibernation" {
  description = "If true, the launched EC2 instance will support hibernation"
  default     = true
  type        = bool
}

variable "host_id" {
  description = "ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host."
  default     = null
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the"
  default     = null
  type        = string
}

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances"
  type        = string
}

variable "ipv6_address_count" {
  description = "Number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet"
  default     = null
  type        = number
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = true
  type        = bool
}

variable "tenancy" {
  description = "Tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware. The host tenancy is not supported for the import-instance command. Valid values are default, dedicated, and host"
  default     = "default"
  type        = string
}

variable "get_password_data" {
  description = "If true, wait for password data to become available and retrieve it. Useful for getting the administrator password for instances running Microsoft Windows."
  default     = false
  type        = bool
}

variable "maintenance_options" {
  description = "Maintenance and recovery options for the instance.Can be 'default' or 'disabled' "
  default     = null
  type = object({
    auto_recovery = string
  })
}

variable "enable_template" {
  description = "Set true to enable launch template"
  default     = false
  type        = bool
}

variable "launch_template" {
  description = "Specifies a Launch Template to configure the instance"
  default     = null
  type = object({
    id      = string
    version = string
  })
}

variable "capacity_reservation_specification" {
  description = "Describes an instance's Capacity Reservation targeting option. Optional variables are capacity_reservation_preference,capacity_reservation_id,capacity_reservation_resource_group_arn"
  default     =  null
  type = string
}

variable "capacity_reservation_target" {
  description = "block supports the following : capacity_reservation_id - (Optional) ,capacity_reservation_resource_group_arn - (Optional)"
  default = {}
  type = map(string)
}

variable "credit_specification_cpu_credits" {
  description = "Configuration block for customizing the credit specification of the instance.  Credit option for CPU usage. Valid values include standard or unlimited. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default"
  default     = "standard"
  type        = string
}

variable "enclave_options_enabled" {
  description = "Enable Nitro Enclaves on launched instances."
  default     = false
  type        = bool
}

variable "ephemeral_block_device" {
  description = " One or more configuration blocks to customize Ephemeral (also known as 'Instance Store') volumes on the instance"
  default     = []
  type = list(object({
    device_name  = string
    no_device    = bool
    virtual_name = string
  }))
}

variable "ec2_tags" {
  description = "ec2 resource specific tags"
  default     = {}
  type        = map(string)
}

variable "subnet_id" {
  description = "VPC Subnet ID to launch in"
  type        = string
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  default     = null
  type        = string
}

variable "ec2_key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource"
  type        = string
}

variable "e2_associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  default     = null
  type        = string
}

variable "root_block_device" {
  description = "Configuration block to customize details about the root block device of the instance"
  default     = []
  type = list(object({
    root_volume_type = string
    root_volume_size = string
    root_volume_tags = map(string)
  }))
}

# device dir  to be changed according to OS used.
variable "ec2_ebs_device" {
  description = "list of map for ebs storage"
  default     = []
  type = list(object({
    device_name = string
    tags        = map(string)
    volume_size = string
    volume_type = string
  }))
}

variable "common_tags" {
  description = "common tags for all resources ec2, ebs storage , root block storage"
  type = map(string)
}



