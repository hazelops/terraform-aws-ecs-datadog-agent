variable "env" {
  description = "Environment name (dev, prod)"
  type        = string
}

variable "name" {
  description = "Name of the Datadog agent container"
  type        = string
  default     = "datadog-agent"
}

variable "app_name" {
  description = "Application name used for Datadog tags"
  type        = string
}


variable "environment" {
  description = "Additional environment variables to pass to the Datadog agent container"
  type        = map(string)
  default     = {}
}

variable "secret_names" {
  description = "List of additional SSM parameter names to pass as secrets to the container (e.g., ['DD_SITE', 'DD_ENV'])"
  type        = list(string)
  default     = []
}

variable "docker_image_name" {
  description = "Docker image name for the Datadog agent"
  type        = string
  default     = "public.ecr.aws/datadog/agent"
}

variable "docker_image_tag" {
  description = "Docker image tag for the Datadog agent"
  type        = string
  default     = "latest"
}

variable "ecs_launch_type" {
  description = "ECS launch type (FARGATE or EC2)"
  type        = string
  validation {
    condition     = contains(["FARGATE", "EC2"], var.ecs_launch_type)
    error_message = "The ecs_launch_type must be either 'FARGATE' or 'EC2'."
  }
}

variable "cloudwatch_log_group" {
  description = "CloudWatch log group name for Datadog agent logs. If empty, json-file driver will be used"
  type        = string
  default     = ""
}

variable "resource_requirements" {
  description = "Resource requirements for Fargate tasks (e.g., [{ type = 'InferenceAccelerator', value = 'device_1' }])"
  type        = list(any)
  default     = []
}

variable "socket_apm_enabled_on_ec2" {
  description = "Enable APM socket for EC2 launch type. Creates Unix socket at /var/run/datadog.sock"
  type        = bool
  default     = false
}

variable "opentelemetry_grpc_endpoint" {
  description = "OpenTelemetry gRPC receiver endpoint"
  type        = string
  default     = "0.0.0.0:4317"
}

variable "opentelemetry_http_endpoint" {
  description = "OpenTelemetry HTTP receiver endpoint"
  type        = string
  default     = "0.0.0.0:4318"
}

variable "enabled" {
  description = "Enable or disable the Datadog agent module"
  type        = bool
  default     = true
}
