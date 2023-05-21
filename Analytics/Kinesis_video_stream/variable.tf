variable "video_stream" {
  type        = string
  description = "A name to identify the stream."
}
variable "data_retention_in_hours" {
  type        = number
  description = "The number of hours that you want to retain the data in the stream. Kinesis Video Streams retains the data in a data store that is associated with the stream. The default value is 0, indicating that the stream does not persist data."
  
}
variable "device_name" {
  type        = string
  description = "The name of the device that is writing to the stream. In the current implementation, Kinesis Video Streams does not use this name."
  default     = null
}
variable "media_type" {
  type        = string
  description = "The media type of the stream. Consumers of the stream can use this information when processing the stream. For more information about media types, see Media Types. If you choose to specify the MediaType, see Naming Requirements for guidelines."
  default     = null
}
variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  
}
variable "kms_key_id" {
  type        = string
  description = "The ID of the AWS Key Management Service (AWS KMS) key that you want Kinesis Video Streams to use to encrypt stream data. If no key ID is specified, the default, Kinesis Video-managed key (aws/kinesisvideo) is used."
  default = null
}
variable "aws_profile" {
  type        = string
  description = "aws profile"

}
variable "aws_region" {
  type        = string
  description = "aws region"

}