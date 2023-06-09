## Description
Creates an App Runner Service which can have code source as GIT Repo, ECR Public or ECR Private.
## Prerequisite
* Code Repository (GitHub)/ECR Public image repository/ECR Private Repository.
* KMS Key ARN for setting up encryption configuration
* AppRunner Role For ECR required if using private ecr repo

## Requirements

| Name | Version   |
|------|-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.4    |

## Providers


| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~>4.4   |


## Resources

| Name | Type |
|------|------|
| [aws_apprunner_service.apprunner_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apprunner_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_deployments_enabled"></a> [auto\_deployments\_enabled](#input\_auto\_deployments\_enabled) | Whether continuous integration from the source repository is enabled for the App Runner service. Defaults to true. | `bool` | n/a | yes |
| <a name="input_auto_scaling_configuration_arn"></a> [auto\_scaling\_configuration\_arn](#input\_auto\_scaling\_configuration\_arn) | The ARN of auto scaling configuration for the App Runner service | `string` | `""` | no |
| <a name="input_code_configuration_source"></a> [code\_configuration\_source](#input\_code\_configuration\_source) | The source of the App Runner configuration. Valid values: REPOSITORY, API | `string` | `"REPOSITORY"` | no |
| <a name="input_code_configuration_values"></a> [code\_configuration\_values](#input\_code\_configuration\_values) | Basic configuration for building and running the App Runner service. Use this parameter to quickly launch an App Runner service without providing an apprunner.yaml file in the source code repository (or ignoring the file if it exists). | <pre>object({<br>    runtime                       = optional(string)<br>    build_command                 = optional(string)<br>    port                          = optional(number)<br>    start_command                 = optional(string)<br>    runtime_environment_variables = optional(map(string))<br>  })</pre> | `null` | no |
| <a name="input_code_connection_arn"></a> [code\_connection\_arn](#input\_code\_connection\_arn) | The connection ARN to use for the App Runner service if the service\_source\_type is 'code' | `string` | `""` | no |
| <a name="input_code_repository_url"></a> [code\_repository\_url](#input\_code\_repository\_url) | The location of the repository that contains the source code. This is required for service\_source\_type 'code' | `string` | `""` | no |
| <a name="input_code_version_type"></a> [code\_version\_type](#input\_code\_version\_type) | The type of version identifier. For a git-based repository, branches represent versions. Valid values: BRANCH | `string` | `"BRANCH"` | no |
| <a name="input_code_version_value"></a> [code\_version\_value](#input\_code\_version\_value) | A source code version. For a git-based repository, a branch name maps to a specific version. App Runner uses the most recent commit to the branch. | `string` | `"main"` | no |
| <a name="input_create"></a> [create](#input\_create) | Controls if App Runner resources should be created | `bool` | `true` | no |
| <a name="input_health_check_configuration"></a> [health\_check\_configuration](#input\_health\_check\_configuration) | The health check configuration for the App Runner service | <pre>object({<br>    healthy_threshold   = number<br>    unhealthy_threshold = number<br>    interval            = number<br>    path                = string<br>    protocol            = string<br>    timeout             = number<br>  })</pre> | `null` | no |
| <a name="input_image_access_role_arn"></a> [image\_access\_role\_arn](#input\_image\_access\_role\_arn) | The access role ARN to use for the App Runner service if the service\_source\_type is 'image' and image\_repository\_type is not 'ECR\_PUBLIC' | `string` | `""` | no |
| <a name="input_image_configuration"></a> [image\_configuration](#input\_image\_configuration) | Configuration for running the identified image. | <pre>object({<br>    port                          = optional(number)<br>    runtime_environment_variables = optional(map(string))<br>    start_command                 = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_image_identifier"></a> [image\_identifier](#input\_image\_identifier) | The identifier of an image. For an image in Amazon Elastic Container Registry (Amazon ECR), this is an image name. | `string` | `""` | no |
| <a name="input_image_repository_type"></a> [image\_repository\_type](#input\_image\_repository\_type) | The type of the image repository. This reflects the repository provider and whether the repository is private or public. Defaults to ECR | `string` | n/a | yes |
| <a name="input_instance_configuration"></a> [instance\_configuration](#input\_instance\_configuration) | The instance configuration for the App Runner service | <pre>object({<br>    instance_role_arn = string<br>    cpu               = number<br>    memory            = number<br>  })</pre> | `null` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | The ARN of the custom KMS key to be used to encrypt the copy of source repository and service logs. By default, App Runner uses an AWS managed CMK | `string` | `""` | no |
| <a name="input_observability_configuration"></a> [observability\_configuration](#input\_observability\_configuration) | The observability configuration of your service | <pre>object({<br>    observability_configuration_arn = string<br>    observability_enabled           = bool<br>  })</pre> | `null` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | App Runner service name | `string` | n/a | yes |
| <a name="input_service_source_type"></a> [service\_source\_type](#input\_service\_source\_type) | The service source type, valid values are 'code' or 'image' | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_vpc_connector_arn"></a> [vpc\_connector\_arn](#input\_vpc\_connector\_arn) | The ARN of the VPC connector to use for the App Runner service | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_arn"></a> [service\_arn](#output\_service\_arn) | The App Runner Service ARN |
| <a name="output_service_id"></a> [service\_id](#output\_service\_id) | An alphanumeric ID that App Runner generated for this service. Unique within the AWS Region |
| <a name="output_service_status"></a> [service\_status](#output\_service\_status) | The App Runner Service Status |
| <a name="output_service_url"></a> [service\_url](#output\_service\_url) | The App Runner Service URL |


## Usage as Modules

| Name                                                   | Source | Version |
|--------------------------------------------------------|--------|---------|
| <a name="module_apprunner"></a> [apprunner](#module\_apprunner) | ../../../Modules/App Runner/App Runner Combined | n/a |

``` 
module "apprunnner" {

    source = "../../../Modules/App Runner/App Runner Combined"
    create                         = true
    auto_scaling_configuration_arn = ""
    service_source_type            = "image"
    image_repository_type          = "ECR_PUBLIC"
    service_name                   = "example-new"
    image_identifier               = "public.ecr.aws/aws-containers/hello-app-runner:latest" 
    image_configuration            = null
    vpc_connector_arn              = null
    kms_key_arn                    = "arn:aws:kms:us-west-2:448269213100:key/31271a6c-99d7-496b-bfe0-4a4ffbdf710e"
    auto_deployments_enabled       = false
    health_check_configuration = {
        healthy_threshold   = 2
        unhealthy_threshold = 5
        interval            = 5
        path                = "/"
        protocol            = "TCP"
        timeout             = 2
    }
    instance_configuration = {
        cpu    = 1024
        memory = 2048
    }
    tags = {
        name : "tf"
    }
}
```