data "aws_region" "current" {}

locals {
  secret_names = concat(var.secret_names, [
    "DD_API_KEY",
  ])

  environment = merge(var.environment,
    {
      DD_APM_ENABLED = "true"
      DD_DOGSTATSD_NON_LOCAL_TRAFFIC = "true"
      DD_APM_NON_LOCAL_TRAFFIC = "true"
      DD_PROCESS_AGENT_ENABLED = "true"
      DD_TAGS = "env:${var.env} app:${var.app_name}"
      DD_TRACE_ANALYTICS_ENABLED = "true"

      // https://www.datadoghq.com/blog/monitor-aws-fargate/
      ECS_FARGATE = var.ecs_launch_type == "FARGATE" ? "true" : "false"
    }
  )

  container_definition = {
    name              = var.name
    image = "${var.docker_image_name}:${var.docker_image_tag}",
    memoryReservation = 128,
    essential = true,
    resourceRequirements = var.resource_requirements

    environment = [for k, v in local.environment : {name = k, value = v}]
      secrets = module.ssm.secrets

      volumeMappings = var.ecs_launch_type == "FARGATE" ? [] : [
        {
          containerVolume = "/var/run/docker.sock",
          hostVolume = "/var/run/docker.sock"
        }
      ],



      logConfiguration = var.cloudwatch_log_group == "" ? {
        logDriver = "json-file"
        options = {}
      } : {
        logDriver = "awslogs",
        options = {
          awslogs-group = var.cloudwatch_log_group
          awslogs-region = data.aws_region.current.name
          awslogs-stream-prefix = var.name
        }
      }
    }


}

module "ssm" {
  source = "hazelops/ssm-secrets/aws"
  version = "~> 1.0"
  env = var.env
  app_name = var.app_name
  names = local.secret_names
}
