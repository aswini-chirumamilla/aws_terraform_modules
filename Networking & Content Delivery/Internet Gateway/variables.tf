variable "vpc_id" {
  type        = string
  description = " Input the id for VPC"
  default     = "10.9.0.0/24"
}


variable "aws_internet_gateway_tags" {
  type = map(string)
  description = " Key-value map of resource tags for the component."
  default = { 
  environment = "dev" }
}
