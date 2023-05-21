variable "aws_profile" {
  description = "Name of profile"
  type        = string
}

variable "aws_region" {
  description = "Name of region"
  type        = string
}


variable "report_name" {
  description = "Unique name for the report. Must start with a number/letter and is case sensitive"
  type        = string
}

variable "additional_schema_elements" {
  description = "A list of schema elements. Valid values are: RESOURCES"
  type        = list(string)
}

variable "time_unit" {
  description = "The frequency on which report data are measured and displayed. Valid values are: HOURLY, DAILY"
  type        = string
}

variable "format" {
  description = "Format for report. Valid values are: textORcsv, Parquet. If Parquet is used, then Compression must also be Parquet"
  type        = string
}

variable "compression" {
  description = "Compression format for report. Valid values are: GZIP, ZIP, Parquet. If Parquet is used, then format must also be Parquet"
  type        = string
}


variable "additional_artifacts" {
  description = "A list of additional artifacts. Valid values are: REDSHIFT, QUICKSIGHT, ATHENA. When ATHENA exists within additional_artifacts, no other artifact type can be declared and report_versioning must be OVERWRITE_REPORT"
  type        = list(string)

}
variable "s3_bucket" {
  description = "Name of the existing S3 bucket to hold generated reports"
  type        = string
}
variable "s3_region" {
  description = "Region of the existing S3 bucket to hold generated reports"
  type        = string
}
variable "s3policy_filepath" {
  description = "S3 policy file"
  type        = string
  default     = null

}

variable "s3_prefix" {
  description = "Report path prefix"
  type        = string
  default     = null
}

variable "refresh_closed_reports" {
  description = "Set to true to update your reports after they have been finalized if AWS detects charges related to previous months"
  type        = bool
  default     = null

}

variable "report_versioning" {
  description = "The version of the report"
  type        = string
  default     = null
}
