
variable "microservicelist" {
  description = "list of Micro services to build and deploy"
  type = list(string)
  default = ["service1"]
}

variable "project"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "account"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "region"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "snstopic"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "sourcebranch"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "iamrole"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "pipelines3"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "targetaccount"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "targetregion"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "targetenvdev"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "targetenvstage"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "targetk8sclusterdev"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "targetk8sclusterstage"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "imagetagprefix"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "imagetagsufix"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "containerport"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "k8snamespacedev"{
    description = "kubernetes namespace for development environment"
    default = ""
    type = string
}

variable "k8snamespacestage"{
    description = "kubernetes namespace for stage environment"
    default = ""
    type = string
}

variable "SonarHost"{
    description = "SonarQube Host"
    default = ""
    type = string
}

variable "SonarToken"{
    description = "SonarQube Access Host"
    default = ""
    type = string
}
