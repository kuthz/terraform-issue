module "elb" {
  source = "./modules/elb-single-listener"

  aws_region = "${var.aws_region}"
  aws_profile = "${var.aws_profile}"

  name = "php"

  lb_port = "80"
  instance_port = "80"

  healthcheck_port     = 80
  healthcheck_protocol = "HTTP"
  healthcheck_url      = "/"

  internal = true

  subnets         = "${var.subnet}"
  security_groups = "${var.security_group}"
}

module "asg" {
  source = "./modules/asg"

  aws_region = "${var.aws_region}"
  aws_profile = "${var.aws_profile}"

  name = "${module.lc.name}"

  subnets = "${var.subnet}"

  launch_configuration_id = "${module.lc.id}"
  load_balancers          = "${module.elb.id}"

  health_check_type         = "ELB"
  health_check_grace_period = "1200"

  min                   = 0
  max                   = 0
  wait_for_elb_capacity = 0
}

module "lc" {
  source = "./modules/lc"

  aws_region  = "${var.aws_region}"
  aws_profile = "${var.aws_profile}"

  name = "php"

  ec2_type      = "t2.medium"
  ec2_image_id  = "ami-fd6c94eb"
  ec2_user_data = "${data.template_file.userdata.rendered}"

  security_groups      = "${var.security_group}"
}

data "template_file" "userdata" {
  template = "${file("cloud-config.yml")}"

  vars {
    test = "2"
  }
}