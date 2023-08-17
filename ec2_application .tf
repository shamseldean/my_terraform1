resource "aws_instance" "application_instance_1" {
  ami                    = "ami-0481e8ba7f486bd99"                      
  instance_type           = "t2.micro"
  subnet_id              = aws_subnet.private-subnet1.id
  key_name               = aws_key_pair.tf-key-pair.id
  vpc_security_group_ids = [aws_security_group.private_security_group1.id]

  tags = {
    Name = "application_instance_1"
  }
}