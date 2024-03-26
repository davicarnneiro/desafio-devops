resource "aws_vpc" "desafio-devops" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.desafio-devops.id
  cidr_block = "10.0.1.0/24"
}
