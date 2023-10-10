#VPC Network
resource "aws_vpc" "tfdemo" {
  cidr_block           = var.address_space
  enable_dns_hostnames = true

  tags = {
    name        = "${var.prefix}-vpc-${var.region}"
    environment = "Production"
  }
}
#Subnet Network
resource "aws_subnet" "tfdemo" {
  vpc_id     = aws_vpc.tfdemo.id
  cidr_block = var.subnet_prefix

  tags = {
    name = "${var.prefix}-subnet"
  }
}
#Internet gateway
resource "aws_internet_gateway" "tfdemo" {
  vpc_id = aws_vpc.tfdemo.id
  tags = {
    Name = "${var.prefix}-internet-gateway"
  }
}
#Route table
resource "aws_route_table" "tfdemo" {
  vpc_id = aws_vpc.tfdemo.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tfdemo.id
  }
}
resource "aws_route_table_association" "tfdemo" {
  subnet_id      = aws_subnet.tfdemo.id
  route_table_id = aws_route_table.tfdemo.id
}