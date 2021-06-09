#Creating NACL
resource "aws_network_acl" "nacl" {

  vpc_id = aws_vpc.vpctest.id
  ingress {
    from_port  = 22
    to_port    = 22
    protocol   = "tcp"
    action     = "allow"
    rule_no    = 888
    cidr_block = "0.0.0.0/0"

  }
  ingress {
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    action     = "allow"
    rule_no    = 999
    cidr_block = "0.0.0.0/0"
  }
  ingress {
    from_port  = 443
    to_port    = 443
    protocol   = "tcp"
    action     = "allow"
    rule_no    = 777
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = "Test-Nacl-01"
  }
}