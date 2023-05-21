variable "vpc_id" {
  type        = string
  description = " Name of IGW"

}
variable "aws_profile" {
  description = "Name of profile"
  type        = string
}

variable "aws_region" {
  description = "Name of region"
  type        = string
}

variable "aws_internet_gateway_tags" {
  type        = map(string)
  description = " Key-value map of resource tags for the component."
  default = {
  environment = "dev" }
}

