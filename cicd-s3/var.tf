variable "project"{
    description = "prefix for bucket name"
    default = "cil"
    type = string
}

variable "region"{
    description = "AWS region"
    default = ""
    type = string
}

variable "bucketnames" {
  description = "list of buckets for cicd"
  type = list(string)
  default = [""]
}

