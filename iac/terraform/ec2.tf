resource "aws_instance" "instance" {
  ami                         = "ami-05c969369880fa2c2"
  instance_type               = "t3.medium"
  vpc_security_group_ids      = [aws_security_group.sg-desafio-devops.id]
  subnet_id                   = aws_subnet.subnet.id
  key_name                    = "devops"
  associate_public_ip_address = true

  tags = {
    Name = "Desafio DevOps"
  }
}
