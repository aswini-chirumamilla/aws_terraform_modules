aws_region                           = "us-east-1"
aws_profile                          = "terraform-practice"
app_name                             = "ebs_app_new"
app_description                      = "EBS Application"
app_lifecycle_max_count              = 128 #if set to 0 then set ebs_lifecycle_max_age_in_days variable
app_lifecycle_max_age_in_days        = 0 #either max_count or max_age_in_days can be set
app_lifecycle_delete_source          = true
application_version_name             = "ebs_application_version_1"
application_version_description      = "application version created by terraform"
app_version_source                   = "python.zip"
force_delete_ebs_application_version = true
bucket_id                            = "aws-devops-training-arul"
elastic_beanstalk_app_tags           = {
  "env" = "dev"
}
role_policy                          = {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ]
}
iam_role_tags                        = {
   "env" = "dev"
}
tags                                 = {
  "Name" = "Elastic Beanstalk"
}
#elastic beanstalk env
tier                                 = "WebServer"
elastic_beanstalk_cname              = null
solution_stack_name                  = "64bit Amazon Linux 2 v3.4.0 running Python 3.7"
beanstalkappenv                      = "myenv"
environment_description              = "environment for elastic beanstalk application"
settings_elastic_beanstalk_env       = [
  {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-097b0574"
  },
  {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "tf-profile"
  },
  {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "True"
  },
  {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-a7dfa996,subnet-bd5f779c"
  },
  {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "MatcherHTTPCode"
    value     = "200"
  },
  {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  },
  {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.medium"
  },

  {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "internet facing"
  },
  {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "1"
  },
  {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "2"
  },
  {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "enhanced"
  }

]