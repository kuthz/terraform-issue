variable "aws_region" {}
variable "aws_profile" {}

variable "name" {
}
variable "security_groups" {
}
variable "ec2_image_id" {
}
variable "ec2_type" {
}
variable "ec2_user_data" {
  default = ""
}
variable "ec2_key_name" {
  default = ""
}
variable "iam_instance_profile" {
  default = ""
}

variable "root_volume_size" {
  default = 20
}
