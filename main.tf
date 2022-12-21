data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

locals {
  global_secrets = concat(var.secret_names, [
    "DD_API_KEY",
  ])

  environment = merge(var.environment, {
    DD_APM_ENABLED                                  = "true"
    DD_DOGSTATSD_NON_LOCAL_TRAFFIC                  = "true"
    DD_APM_NON_LOCAL_TRAFFIC                        = "true"
    DD_PROCESS_AGENT_ENABLED                        = "true"
    DD_TAGS                                         = "env:${var.env} app:${var.app_name}"
    DD_TRACE_ANALYTICS_ENABLED                      = "true"
    DD_RUNTIME_METRICS_ENABLED                      = "true"
    DD_PROFILING_ENABLED                            = "true"
    DD_LOGS_INJECTION                               = "true"
    DD_OTLP_CONFIG_RECEIVER_PROTOCOLS_GRPC_ENDPOINT = var.opentelemetry_grpc_endpoint
    DD_OTLP_CONFIG_RECEIVER_PROTOCOLS_HTTP_ENDPOINT = var.opentelemetry_http_endpoint

    // https://www.datadoghq.com/blog/monitor-aws-fargate/
    ECS_FARGATE = var.ecs_launch_type == "FARGATE" ? "true" : "false"
    }, (var.ecs_launch_type == "EC2" && var.socket_apm_enabled_on_ec2) ? {
    DD_APM_RECEIVER_SOCKET = "/var/run/datadog.sock"
    DD_TRACE_AGENT_URL     = "/var/run/datadog.sock"
    } : {}
  )

  container_definition = {
    name                 = var.name
    image                = "${var.docker_image_name}:${var.docker_image_tag}",
    memoryReservation    = 128,
    essential            = true,
    resourceRequirements = var.resource_requirements

    environment = [
      for k, v in local.environment : {
        name  = k,
        value = v
      }
    ]

    secrets = [
      for param_name in local.global_secrets :
      {
        name      = param_name
        valueFrom = "arn:aws:ssm:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:parameter/${var.env}/global/${param_name}"
      }
    ]

    mountPoints = var.ecs_launch_type == "FARGATE" ? [] : concat([
      {
        containerPath = "/var/run/docker.sock"
        sourceVolume  = "docker-sock"
      },
      {
        containerPath = "/host/sys/fs/cgroup"
        sourceVolume  = "cgroup"
        // This is disabled temporarily to overcome json unmarshaling issue
        //        readOnly      = true
      },
      {
        containerPath = "/host/proc"
        sourceVolume  = "proc"
        // This is disabled temporarily to overcome json unmarshaling issue
        //        readOnly = true
      },


      ], var.socket_apm_enabled_on_ec2 ? [
      {
        containerPath = "/var/run/datadog.sock"
        sourceVolume  = "datadog-sock"
        // This is disabled temporarily to overcome json unmarshaling issue
        //        readOnly = true
      }
      ] : []
    )


    portMappings = [
      {
        protocol      = "tcp",
        containerPort = 8126
      },
      {
        protocol      = "udp",
        containerPort = 8125
      }
    ]

    logConfiguration = var.cloudwatch_log_group == "" ? {
      logDriver = "json-file"
      options   = {}
      } : {
      logDriver = "awslogs",
      options = {
        awslogs-group         = var.cloudwatch_log_group
        awslogs-region        = data.aws_region.current.name
        awslogs-stream-prefix = var.name
      }
    }
  }

  volumes = concat(var.ecs_launch_type == "FARGATE" ? [] : [
    {
      name      = "docker-sock"
      host_path = "/var/run/docker.sock"
    },
    {
      name      = "proc"
      host_path = "/proc/"
    },
    {
      name      = "cgroup"
      host_path = "/cgroup/"
    }

    ], var.socket_apm_enabled_on_ec2 ? [
    {
      name      = "datadog-sock"
      host_path = "/var/run/datadog.sock"
      mount_point = {
        "sourceVolume"  = "datadog-sock"
        "containerPath" = "/var/run/datadog.sock"
        "readOnly"      = null
      }
    }
    ] : []
  )

}
