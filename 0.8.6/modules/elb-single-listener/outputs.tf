output "dns_name" {
  value = "${aws_elb.default.dns_name}"
}

output "zone_id" {
  value = "${aws_elb.default.zone_id}"
}

output "id" {
  value = "${aws_elb.default.id}"
}
