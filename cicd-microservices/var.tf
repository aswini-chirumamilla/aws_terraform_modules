variable "project"{
    description = "project name"
    default = ""
    type = string
}

variable "account"{
    description = "AWS account"
    default = ""
    type = string
}

variable "region"{
    description = "AWS Region"
    default = ""
    type = string
}

variable "microservicelist" {
  description = "list of microservices names"
  type = list(string)
  default = [""]
}

variable "buckets" {
  description = "list of buckets for cicd"
  type = list(string)
  default = ["pipeline-atrifact-store","codebuild-cache","templates"]
}

variable "source_branch"{
    description = "git repo source branch"
    default = ""
    type = string
}

variable "dev_environment"{
    description = "target development environment"
    default = ""
    type = string
}

variable "stage_environment"{
    description = "target stage environment"
    default = ""
    type = string
}

variable "dev_k8scluster"{
    description = "target development k8s cluster"
    default = ""
    type = string
}

variable "stage_k8scluster"{
    description = "target stage k8s cluster"
    default = ""
    type = string
}

variable "target_region"{
    description = "target deployment region"
    default = ""
    type = string
}

variable "container_port"{
    description = "micro-service container port exposed"
    default = ""
    type = string
}

variable "image_tagprefix"{
    description = "prefix for tag for micro service image built"
    default = ""
    type = string
}

variable "k8s_namespace_dev"{
    description = "kubernetes namespace for development environment"
    default = ""
    type = string
}

variable "k8s_namespace_stage"{
    description = "kubernetes namespace for stage environment"
    default = ""
    type = string
}

variable "sonar_host"{
    description = "SonarQube Host"
    default = ""
    type = string
}

variable "sonar_token"{
    description = "SonarQube Access Host"
    default = ""
    type = string
}

