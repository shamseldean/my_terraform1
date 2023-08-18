resource "aws_instance" "junkinz_server" {
    ami                    = "ami-0481e8ba7f486bd99"                      
    instance_type          = "t2.micro"
    subnet_id              = aws_subnet.public-subnet1.id
    key_name               = aws_key_pair.tf-key-pair.id
    vpc_security_group_ids = [aws_security_group.public_security_group1.id]

    user_data = <<-EOF
                            #!/bin/bash 
                            echo '${tls_private_key.rsa-key.private_key_pem}'  > /home/ubuntu/tf-key-pair.pem
                            chmod 400 tf-key-pair.pem
                            sudo apt update
                            sudo apt install openjdk-11-jdk -y
                            sudo apt install maven -y
                            sudo apt install openjdk-8-jdk -y

                            curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
                            /usr/share/keyrings/jenkins-keyring.asc > /dev/null
                            echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
                            https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
                            /etc/apt/sources.list.d/jenkins.list > /dev/null

                            sudo apt-get update
                            sudo apt-get install jenkins
                            EOF

    tags = {
        Name = "junkinz-server"
    }
}