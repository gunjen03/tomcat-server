resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_protocol"
  description = "this security group allows ssh and http"
  vpc_id      = var.vpc_id
  

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #var.pub_vpc/vpn_ip or include you personce pc IP
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #var.pub_vpc/vpn_ip or include you personce pc IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #var.pub_vpc/vpn_ip or include you personce pc IP
  }

}