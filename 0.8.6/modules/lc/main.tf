resource "aws_launch_configuration" "default" {
  name_prefix          = "${var.name}"
  image_id             = "${var.ec2_image_id}"
  instance_type        = "${var.ec2_type}"
  security_groups      = ["${split(",", var.security_groups)}"]
  user_data            = "${var.ec2_user_data}"
  key_name             = "${var.ec2_key_name}"
  iam_instance_profile = "${var.iam_instance_profile}"

  root_block_device {
    volume_size = "${var.root_volume_size}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
