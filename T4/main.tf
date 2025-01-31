terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0a897ba00eaed7398"  # Reemplaza con una AMI válida para tu región
  instance_type = "t2.micro"

  tags = {
    Name = "AppServer"
  }
}
