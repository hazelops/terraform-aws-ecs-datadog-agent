# AWS ECS Datadog Agent Terraform Module

This module is used to deploy side-car container with a [DataDog](https://www.datadoghq.com) agent to Fargate ECS.

## Security & Compliance [<img src="https://cloudposse.com/wp-content/uploads/2020/11/bridgecrew.svg" width="250" align="right" />](https://bridgecrew.io/)

Security scanning is graciously provided by Bridgecrew.

| Benchmark | Description |
|--------|---------------|
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=INFRASTRUCTURE+SECURITY) | Infrastructure Security Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=CIS+AWS+V1.2) | Center for Internet Security, AWS V1.2 Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=CIS+AZURE+V1.1) | Center for Internet Security, AZURE V1.1 Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=PCI-DSS+V3.2) | Payment Card Industry Data Security Standards V3.2 Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=NIST-800-53) | National Institute of Standards and Technology Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=ISO27001) | Information Security Management System, ISO/IEC 27001 Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=SOC2) | Service Organization Control 2 Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=CIS+GCP+V1.1) | Center for Internet Security, GCP Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=HIPAA) | Health Insurance Portability and Accountability Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/pci_dss_v321)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=PCI-DSS+V3.2.1) | PCI-DSS V3.2.1 Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/fedramp_moderate)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=FEDRAMP+%28MODERATE%29) | FEDRAMP (MODERATE) Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=CIS+KUBERNETES+V1.5) | Center for Internet Security, KUBERNETES V1.5 Compliance  |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/cis_aws_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=CIS+AWS+V1.3) | Center for Internet Security, AWS V1.3 Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/cis_azure_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=CIS+AZURE+V1.3) | Center for Internet Security, AZURE V1.3 Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/cis_docker_12)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=CIS+DOCKER+V1.2) | Center for Internet Security, Docker V1.2 Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/cis_eks_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=CIS+EKS+V1.1) | Center for Internet Security, EKS V1.1 Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/cis_gke_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=CIS+GKE+V1.1) | Center for Internet Security, GKE V1.1 Compliance |
| [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/hazelops/terraform-aws-ecs-datadog-agent/cis_kubernetes_16)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=hazelops%2Fterraform-aws-ecs-datadog-agent&benchmark=CIS+KUBERNETES+V1.6) | Center for Internet Security, KUBERNETES V1.6 Compliance |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

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
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_cloudwatch_log_group"></a> [cloudwatch\_log\_group](#input\_cloudwatch\_log\_group) | n/a | `string` | `""` | no |
| <a name="input_docker_image_name"></a> [docker\_image\_name](#input\_docker\_image\_name) | n/a | `string` | `"datadog/agent"` | no |
| <a name="input_docker_image_tag"></a> [docker\_image\_tag](#input\_docker\_image\_tag) | n/a | `string` | `"latest"` | no |
| <a name="input_ecs_launch_type"></a> [ecs\_launch\_type](#input\_ecs\_launch\_type) | n/a | `any` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"datadog-agent"` | no |
| <a name="input_resource_requirements"></a> [resource\_requirements](#input\_resource\_requirements) | n/a | `list` | `[]` | no |
| <a name="input_secret_names"></a> [secret\_names](#input\_secret\_names) | n/a | `list(string)` | `[]` | no |
| <a name="input_socket_apm_enabled_on_ec2"></a> [socket\_apm\_enabled\_on\_ec2](#input\_socket\_apm\_enabled\_on\_ec2) | n/a | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_definition"></a> [container\_definition](#output\_container\_definition) | n/a |
| <a name="output_volumes"></a> [volumes](#output\_volumes) | n/a |
