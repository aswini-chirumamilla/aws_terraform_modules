variable "project"{
    description = "prefix for bucket name"
    default = "cil"
    type = string
}

variable "account"{
    description = "AWS account"
    default = ""
    type = string
}

variable "region"{
    description = "AWS region"
    default = ""
    type = string
}
