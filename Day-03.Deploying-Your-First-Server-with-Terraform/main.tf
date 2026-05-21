# Configure the AWS provider
provider "aws" {
  region = "eu-north-1"
}
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
  
}

resource "aws_instance" "web_server" {
    ami = "ami-0028809abe98af413"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.web_sg.id]
    associate_public_ip_address = true

    user_data = <<-EOF
                #!/bin/bash
                apt update -y
                apt install nginx -y
                systemctl start nginx
                systemctl enable nginx
                echo "Hello, World! This is my first server deployed with Terraform." > /var/www/html/index.html
                EOF

    #so that when you change the user_data parameter and run apply,Terraform will terminate the original instance and launch a totally new one.            
    user_data_replace_on_change = true

    tags = {
        Name = "first-iac-Server"
    }
}

output "pubic_ip" {
  value = aws_instance.web_server.public_ip
  description = "web_server's public ip"
}