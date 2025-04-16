# locals {
#   # Set the default region to us-east-1
#   aws_region = "us-east-1"
#   environment = "lab"
# }


# resource "random_id" "random" {
#   byte_length = 20
# }

# module "runners" {
#   source  = "github-aws-runners/github-runner/aws"
#   version = "6.1.0"
#   create_service_linked_role_spot = true
#   aws_region                      = var.aws_region
#   vpc_id                          = var.vpc_id
#   subnet_ids                      = var.subnet_ids


#   github_app = {
#     key_base64     = var.key_base64
#     id             = var.app_id
#     webhook_secret = random_id.random.hex
#   }

#   # When not explicitly set lambda zip files are grapped from the module requiring lambda build.
#   # Alternatively you can set the path to the lambda zip files here.
#   #
#   # For example grab zip files via lambda_download
#   webhook_lambda_zip                = "../lambdas-download/webhook.zip"
#   runner_binaries_syncer_lambda_zip = "../lambdas-download/runner-binaries-syncer.zip"
#   runners_lambda_zip                = "../lambdas-download/runners.zip"

#   runner_extra_labels         = ["default"]

#   # enable access to the runners via SSM
#   enable_ssm_on_runners = true

#   # Let the module manage the service linked role
#   # create_service_linked_role_spot = true

#   instance_types = ["t2.micro"]

#   # override delay of events in seconds
#   delay_webhook_event = 0

#   # Ensure you set the number not too low, each build require a new instance
#   runners_maximum_count = 2

#   # override scaling down
#   scale_down_schedule_expression = "cron(* * * * ? *)"

#   enable_ephemeral_runners = true

#   # # Example of simple pool usages
#   # pool_runner_owner = "philips-test-runners"
#   # pool_config = [{
#   #   size                         = 3
#   #   schedule_expression = "cron(0/3 14 * * ? *)" # every 3 minutes between 14:00 and 15:00
#   #   schedule_expression_timezone = "Europe/Amsterdam"

#   # }]
#   #
#   #
#   enable_job_queued_check = true
#   enable_organization_runners = true
  
  

  # tracing_config = {
  #   mode                  = "Active"
  #   capture_error         = true
  #   capture_http_requests = true
  # }


  # configure your pre-built AMI
  # enable_userdata = false
  # ami_filter      = { name = ["github-runner-al2023-x86_64-*"], state = ["available"] }
  # ami_owners      = [data.aws_caller_identity.current.account_id]

  # or use the default AMI
  # enable_userdata = true

  # Enable debug logging for the lambda functions
  # log_level = "debug"

  # Setup a dead letter queue, by default scale up lambda will kepp retrying to process event in case of scaling error.
  # redrive_policy_build_queue = {
  #   enabled             = true
  #   maxReceiveCount     = 50 # 50 retries every 30 seconds => 25 minutes
  #   deadLetterTargetArn = null
  # }

#   # Enable beta feature job retry
#   job_retry = {
#     enable           = true
#     max_attempts     = 1
#     delay_in_seconds = 180
#   }
}