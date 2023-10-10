# Outputs file
output "aws_vpc_id" {
  value = aws_vpc.tfdemo.id
}
output "aws_subnet_id" {
  value = aws_subnet.tfdemo.id
}

