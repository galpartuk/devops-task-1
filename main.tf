terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Create a VPC
resource "aws_vpc" "gal" {
  cidr_block = "192.150.5.0/24"
  tags = {
    "name"="galVpc"
  }
}

# Subnet web
resource "aws_subnet" "subnet_web" {
  vpc_id = aws_vpc.gal.id
  cidr_block = "192.150.5.0/27"
  tags = {
    "name"="subnetWeb"
  }
}

# Subnet app
resource "aws_subnet" "subnet_app" {
  vpc_id = aws_vpc.gal.id
  cidr_block = "192.150.5.32/27"
  tags = {
    "name"="subnetApp"
  }
}

# Subnet db
resource "aws_subnet" "subnet_db" {
  vpc_id = aws_vpc.gal.id
  cidr_block = "192.150.5.64/28"
  tags = {
    "name"="subnetDb"
  }
}