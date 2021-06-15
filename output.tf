output "ec2_pubips" {
    value = [element(aws_instance.ec2.*.public_ip, count.index)]
}