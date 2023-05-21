variable "codebuild-name"{
    description = "codebuild project name"
    default = ""
    type = string
}

variable "codebuild-description"{
    description = "codebuild project description"
    default = ""
    type = string
}

variable "service-role-iam"{
    description = "iam role for codebuild"
    default = ""
    type = string
}

variable "buildspec"{
    description = "codebuild project buildspec name"
    default = ""
    type = string
}

variable "s3cache"{
    description = "codebuild cache bucket"
    default = ""
    type = string
}