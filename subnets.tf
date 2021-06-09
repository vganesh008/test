#Creating subnets
resource "aws_subnet" "testsubnet" {
  count             = length(var.subnet_cidr)
  vpc_id            = aws_vpc.vpctest.id
  cidr_block        = element(var.subnet_cidr, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "Test-sub${count.index + 1}"

  }
}