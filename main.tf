provider "aws"{
    region = "us-east-2"
    access_key =""
    secret_key =""
}
resource "aws_vpc" "first_VPC" {
    cidr_block = "10.0.0.0/16"
}
resource "aws_instance" "ec2"{
  ami           = "ami-08333bccc35d71140"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.SG_1.name]
  key_name = "terraform"


  tags = {
      Name = "Terraform ec2"
    } 
}

resource "aws_security_group" "SG_1" {
    name  = "aws-security group"
    description = "security group with terraform"
    vpc_id    = "vpc-0b3d6e59adb164bd8"

    ingress{
     description = "HTTPS"
     from_port = 443
     to_port = 443
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
     ipv6_cidr_blocks =["::/0"]
    }

    ingress{
     description = "HTTP"
     from_port = 80
     to_port = 80
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
     ipv6_cidr_blocks =["::/0"]
    }

    ingress {
     description = "ssh"
     from_port = 22
     to_port = 22
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
     ipv6_cidr_blocks =["::/0"]
    }
    egress {
     from_port        = 0
     to_port          = 0
     protocol         = "-1"
     cidr_blocks      = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
  }

    tags={
        Name = "SG_1"
    }
    }
