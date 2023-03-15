terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}


resource "aws_instance" "app_server" {
  ami           = data.aws_ami.server_ami.id
  instance_type = var.instance
  key_name      = aws_key_pair.ssh-key.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_https.id, aws_security_group.allow_http.id]
  tags = {
    Name = "${var.instance_name} Ansible Python"
  }
}


resource "aws_key_pair" "ssh-key" {
  key_name   = var.ssh-key
  public_key = file("${var.ssh-key}.pub")
}

output "server_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "server_public_dns" {
  value = aws_instance.app_server.public_dns
}

