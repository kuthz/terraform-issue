variable "aws_region" {}
variable "aws_profile" {}

variable "name" {
}
variable "subnets" {
}
variable "security_groups" {
}
variable "instance_port" {
}
variable "instance_protocol" {
  default = "http"
}
variable "lb_port" {
}
variable "lb_protocol" {
  default = "http"
}
variable "ssl_certificate_id" {
  default = ""
}
variable "internal" {
  default = true
}
variable "cross_zone_load_balancing" {
  default = true
}
variable "connection_draining" {
  default = true
}
variable "connection_draining_timeout" {
  default = 600
}
variable "healthcheck_port" {
}
variable "healthcheck_protocol" {
  default = "HTTP"
}
variable "healthcheck_url" {
  default = "/"
}
