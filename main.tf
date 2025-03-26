terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"]  # Canonical (official Ubuntu owner ID)
}



# Public EC2 Instances
resource "aws_instance" "Jenkins_Server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.medium"
  key_name               = "my_key"
  associate_public_ip_address = true

  tags = {
    Name = "Ubuntu-Jenkins_Server"
  }
}

resource "aws_instance" "SonarQube_Server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = "my_key"
  associate_public_ip_address = true

  tags = {
    Name = "Ubuntu-SonarQube_Server"
  }
}


resource "aws_instance" "Docker_Server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = "my_key"
  associate_public_ip_address = true

  tags = {
    Name = "Ubuntu-Docker_Server"
  }
}