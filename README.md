# AWS ECS Datadog Agent Terraform Module

This module is used to deploy side-car container with a [DataDog](https://www.datadoghq.com) agent to Fargate ECS.

## Important: AWS Provider Version Compatibility

**This module requires AWS Provider version 6.x or higher.**

If you're upgrading from AWS Provider v5.x, please note:
- The module uses the new `data.aws_region.current.region` attribute (v5.x used `.name` which is deprecated in v6.x)
- No infrastructure changes are required - upgrade is backward compatible
- Ensure your AWS provider is pinned to `~> 6.0` in your root module

For more information, please view the [AWS Provider v6 Upgrade Guide](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/version-6-upgrade).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name used for Datadog tags | `string` | n/a | yes |
| <a name="input_cloudwatch_log_group"></a> [cloudwatch\_log\_group](#input\_cloudwatch\_log\_group) | CloudWatch log group name for Datadog agent logs. If empty, json-file driver will be used | `string` | `""` | no |
| <a name="input_docker_image_name"></a> [docker\_image\_name](#input\_docker\_image\_name) | Docker image name for the Datadog agent | `string` | `"public.ecr.aws/datadog/agent"` | no |
| <a name="input_docker_image_tag"></a> [docker\_image\_tag](#input\_docker\_image\_tag) | Docker image tag for the Datadog agent | `string` | `"latest"` | no |
| <a name="input_ecs_launch_type"></a> [ecs\_launch\_type](#input\_ecs\_launch\_type) | ECS launch type (FARGATE or EC2) | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Enable or disable the Datadog agent module | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment name (dev, prod) | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Additional environment variables to pass to the Datadog agent container | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Datadog agent container | `string` | `"datadog-agent"` | no |
| <a name="input_opentelemetry_grpc_endpoint"></a> [opentelemetry\_grpc\_endpoint](#input\_opentelemetry\_grpc\_endpoint) | OpenTelemetry gRPC receiver endpoint | `string` | `"0.0.0.0:4317"` | no |
| <a name="input_opentelemetry_http_endpoint"></a> [opentelemetry\_http\_endpoint](#input\_opentelemetry\_http\_endpoint) | OpenTelemetry HTTP receiver endpoint | `string` | `"0.0.0.0:4318"` | no |
| <a name="input_resource_requirements"></a> [resource\_requirements](#input\_resource\_requirements) | Resource requirements for Fargate tasks (e.g., [{ type = 'InferenceAccelerator', value = 'device\_1' }]) | `list(any)` | `[]` | no |
| <a name="input_secret_names"></a> [secret\_names](#input\_secret\_names) | List of additional SSM parameter names to pass as secrets to the container (e.g., ['DD\_SITE', 'DD\_ENV']) | `list(string)` | `[]` | no |
| <a name="input_socket_apm_enabled_on_ec2"></a> [socket\_apm\_enabled\_on\_ec2](#input\_socket\_apm\_enabled\_on\_ec2) | Enable APM socket for EC2 launch type. Creates Unix socket at /var/run/datadog.sock | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_definition"></a> [container\_definition](#output\_container\_definition) | n/a |
| <a name="output_volumes"></a> [volumes](#output\_volumes) | n/a |
<!-- END_TF_DOCS -->