variable "project"{
    description = "prefix for ecr name"
    default = "cil"
    type = string
}

variable "microservicelist" {
  description = "list of microservices names"
  type = list(string)
  default = [""]
}