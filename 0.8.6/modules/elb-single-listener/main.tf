resource "aws_elb" "default" {
  name                        = "${var.name}"
  subnets                     = ["${split(",", var.subnets)}"]
  security_groups             = ["${split(",", var.security_groups)}"]
  cross_zone_load_balancing   = "${var.cross_zone_load_balancing}"
  internal                    = "${var.internal}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"

  lifecycle {
    create_before_destroy = true
  }

  listener {
    instance_port      = "${var.instance_port}"
    instance_protocol  = "${var.instance_protocol}"
    lb_port            = "${var.lb_port}"
    lb_protocol        = "${var.lb_protocol}"
    ssl_certificate_id = "${var.ssl_certificate_id}"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 10
    target              = "${var.healthcheck_protocol}:${var.healthcheck_port}${var.healthcheck_url}"
    interval            = 30
  }
}
