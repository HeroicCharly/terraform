
# This will help you create a basic AWS infrastructure using AWS provider.
# Pre-requisites:
# * It is required to have the AWS credentials configured in environment variables.

terraform {

  # This is the list of providers terraform will use
  # to provision the infrastructure. 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0" # This defines the terraform version to be used.
}

# This is the way the `hashicorp/aws` provider
# is initialized.
# Ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs#example-usage 
provider "aws" {
  region = "us-west-2"
}

# This is how the resource `aws_instance` is declared.
resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3" # This AMI was provided by the official documentation example.
  instance_type = "t2.micro"

  tags = {
    Name   = "aws-with-terraform"
  }
}