provider "aws" {
  access_key = var.aws_access
  secret_key = var.aws_secret
  region     = var.aws_region

}


#Creating vpc

resource "aws_vpc" "vpctest" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"
  tags = {
    Name  = "Test-vpc-01"
    Env   = "Test"
    Owner = "Unix Team"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpctest.id
  tags = {
    Name = "Test-ig-01"
  }
}
