resource "aws_instance" "ec2" {
  count                       = 2
  ami                         = "ami-0b0af3577fe5e3532"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.testsubnet.0.id
  key_name                    = "my_key"
  vpc_security_group_ids      = [aws_security_group.testsg.id]
  associate_public_ip_address = "true"
  user_data                   = <<-EOF
    #!/bin/bash
    #yum install -y
    yum install httpd -y
    yum install git* -y
    curl https://get.docker.com |bash
    EOF
  tags = {
    Name  = "Terraform"
    Batch = "5AM"
  }
}