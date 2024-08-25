terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.64.0"
    }
  }

  backend "s3" {
    bucket         = "my-super-terraform-state"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
  }
}


provider "aws" {
  region = var.region
}


resource "aws_instance" "example" {
  ami           = "ami-0af698e8b97debc7d"
  instance_type = "t2.micro"
  tags = {
    Name = "ExampleInstance"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket  = "my-super-bucket-1"
  tags    = {
	Name          = "MyS3Bucket"
	Environment    = "Production"
  }
}