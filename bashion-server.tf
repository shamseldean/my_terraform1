resource "aws_instance" "bastion_server" {
  ami                    = "ami-0481e8ba7f486bd99"                      
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public-subnet1.id
  key_name               = aws_key_pair.tf-key-pair.id
  vpc_security_group_ids = [aws_security_group.public_security_group1.id]

  user_data = <<-EOF
                        #!/bin/bash 
                        echo '${tls_private_key.rsa-key.private_key_pem}'  > /home/ubuntu/tf-key-pair.pem
                        chmod 400 tf-key-pair.pem
                        EOF

  tags = {
    Name = "bashion-host"
  }
}



# "ami-0ff8a91507f77f867"