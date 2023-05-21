#--------------------------------------Variables related to EBS Volume resource-------------------------------------------------#

variable "ebs_volumes" {
  description = "A configuration block that defines required and optional arguments for the creation of ebs volumes."
  type = list(object({
    availability_zone    = string                  # (Required) The AZ where the EBS volume will exist.
    size                 = optional(number, null)  # The size of the drive in GiBs.
    type                 = optional(string, null)  # The type of EBS volume. Can be standard, gp2, gp3, io1, io2, sc1 or st1
    final_snapshot       = optional(string, false) # If true, snapshot will be created before volume deletion.
    iops                 = optional(number, null)  # The amount of IOPS to provision for the disk. Only valid for type of io1, io2 or gp3.
    multi_attach_enabled = optional(string, false) # Specifies whether to enable Amazon EBS Multi-Attach. Multi-Attach is supported on io1 and io2 volumes.
    snapshot_id          = optional(string, null)  # A snapshot to base the EBS volume off of.
    encrypted            = optional(string, false) # If true, the disk will be encrypted.
    kms_key_id           = optional(string, null)  # The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true.
    throughput           = optional(number, null)  # The throughput that the volume supports, in MiB/s. Only valid for type of gp3.
    tag                  = map(string)             # A map of tags to assign to the resource.(Tag is mandatory parameter in this module)
  }))
}

#--------------------------------------Variables related to EBS Snapshot resource-------------------------------------------------#

variable "ebs_snapshot" {
  description = "A configuration block that defines required and optional arguments for the creation of ebs snapshots."
  type = list(object({
    description            = optional(string, null)  # A description of what the snapshot is.
    outpost_arn            = optional(string, null)  # The Amazon Resource Name (ARN) of the Outpost on which to create a local snapshot.
    storage_tier           = optional(string, null)  # The name of the storage tier. Valid values are archive and standard. Default value is standard.
    permanent_restore      = optional(string, false) # Indicates whether to permanently restore an archived snapshot.
    temporary_restore_days = optional(string, null)  # Specifies the number of days for which to temporarily restore an archived snapshot. Required for temporary restores only.
    tags                   = map(string)             # A map of tags to assign to the snapshot.(Tag is mandatory parameter in this module if create_ebs_snapshot is set to true)
  }))
  default = []
}

variable "create_ebs_snapshot" {
  description = "To specify whether or not to create snapshots for the volumes."
  type        = bool
  default     = false
}