#Creating security group 
locals {
  ports  = [22, 80, 443, 3389, 2049, 123, 53]
  ports1 = [22, 80, 443, 3389, 2049, 123, 53]
}
resource "aws_security_group" "testsg" {
  name   = "allow ssh"
  vpc_id = aws_vpc.vpctest.id
  dynamic "ingress" {
    for_each = local.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = local.ports1
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


}