resource "aws_eip" "elastic_ip_gate" {

  vpc = true
  tags = {
    Name = "elastic_ip_gate"
  }
}