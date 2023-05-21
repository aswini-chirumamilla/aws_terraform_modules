variable "project"{
    description = "project - prefix for codecommit name"
    default = ""
    type = string
}

variable "microservicelist" {
  description = "list of microservices names"
  type = list(string)
  default = [""]
}