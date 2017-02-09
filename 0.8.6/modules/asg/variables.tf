variable "aws_region" {}
variable "aws_profile" {}

variable "name" {}
# Autoscaling
# https://www.terraform.io/docs/providers/aws/r/autoscaling_group.html#waiting-for-capacity
# Terraform considers an instance "healthy" when the ASG reports HealthStatus: "Healthy" and LifecycleState: "InService".
# Waits after ASG creation for min_size (or desired_capacity, if specified) healthy instances to show up in the ASG before continuing.
variable "min" { default = "1" }
variable "max" { default = "1" }

variable "force_delete" { default = true }
variable "launch_configuration_id" {}
variable "load_balancers" { default = "" }
variable "subnets" {}
variable "health_check_type" { default = "EC2" }
variable "health_check_grace_period" { default = "300" }
# Maximum amount of time to wait for getting to minimum/desired number of healthy instances. "0" disables ASG Capacity waiting
variable "wait_for_capacity_timeout" { default = "20m" }
variable "termination_policies" { default = "OldestLaunchConfiguration" }
# Wait for exactly that number of Instances to be "InService" in all attached ELBs on both creation and updates
variable "wait_for_elb_capacity" { default = 1 }
