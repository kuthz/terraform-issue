resource "aws_autoscaling_group" "default" {
  name                      = "${var.name}"
  min_size                  = "${var.min}"
  max_size                  = "${var.max}"
  force_delete              = "${var.force_delete}"
  launch_configuration      = "${var.launch_configuration_id}"
  load_balancers            = ["${split(",", var.load_balancers)}"]
  vpc_zone_identifier       = ["${split(",", var.subnets)}"]
  health_check_grace_period = "${var.health_check_grace_period}"
  # https://www.terraform.io/docs/providers/aws/r/autoscaling_group.html#waiting-for-capacity
  termination_policies      = ["${split(",", var.termination_policies)}"]
  wait_for_capacity_timeout = "${var.wait_for_capacity_timeout}"
  wait_for_elb_capacity     = "${var.wait_for_elb_capacity}"
  health_check_type         = "${var.health_check_type}"

  lifecycle {
    create_before_destroy = true
  }
}
