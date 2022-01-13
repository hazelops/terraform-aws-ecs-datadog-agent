variable "env" {
}

variable "name" {
  default = "datadog-agent"
}

variable "app_name" {
  type = string
}


variable "environment" {
  type    = map(string)
  default = {}
}

variable "secret_names" {
  type    = list(string)
  default = []
}

//variable "ecs_cluster" {
//  type = string
//}

variable "docker_image_name" {
  type    = string
  default = "public.ecr.aws/datadog/agent"
}

variable "docker_image_tag" {
  type    = string
  default = "latest"
}

variable "ecs_launch_type" {

}

variable "cloudwatch_log_group" {
  default = ""
}

variable "resource_requirements" {
  default = []
}

variable "socket_apm_enabled_on_ec2" {
  default = false
}

variable "enabled" {
  default = true
}
