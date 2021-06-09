#creating TR table & RT sunet association
resource "aws_route_table" "rttest" {

  vpc_id = aws_vpc.vpctest.id
  tags = {
    Name = "Test-RT"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


}

#creating RT association
resource "aws_route_table_association" "testassoc" {
  count          = length(var.subnet_cidr)
  route_table_id = aws_route_table.rttest.id
  subnet_id      = element(aws_subnet.testsubnet.*.id, count.index)
}
