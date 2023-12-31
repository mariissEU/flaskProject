# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
}

# Create vpc
resource "aws_vpc" "maris-test-vpc" {
  cidr_block = "172.196.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "maris-test-vpc_TF"
    Owner = "Maris Liepins"
  }
}

# Create route table for the VPC
resource "aws_route_table" "maris-test-route-table" {
  vpc_id = aws_vpc.maris-test-vpc.id

  route {
    cidr_block = aws_vpc.maris-test-vpc.cidr_block
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.maris-test-gw.id
  }

  tags = {
    Name = "maris-test-RT_TF"
    Owner = "Maris Liepins"
  }
}

resource "aws_main_route_table_association" "association" {
  vpc_id         = aws_vpc.maris-test-vpc.id
  route_table_id = aws_route_table.maris-test-route-table.id
}

# Create Internet GW
resource "aws_internet_gateway" "maris-test-gw" {
  vpc_id = aws_vpc.maris-test-vpc.id

  tags = {
    Name = "maris-test-GW_TF"
    Owner = "Maris Liepins"
  }
}

resource "aws_subnet" "maris-test-subnet" {
  vpc_id     = aws_vpc.maris-test-vpc.id
  cidr_block = "172.196.1.0/24"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "maris-test-subnet_TF"
    Owner = "Maris Liepins"
  }
}

# Create Security group
resource "aws_security_group" "maris-test-sg" {
  name        = "maris-test-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.maris-test-vpc.id

  ingress {
      description      = "SSH from Public"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  ingress {
      description      = "App wise Ports specific to local"
      from_port        = 1000
      to_port          = 9999
      protocol         = "tcp"
      cidr_blocks      = ["212.18.129.200/32"]
    }  

  ingress {
      description      = "TLS from Public"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  ingress {
      description      = "HTTP from Public"
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
    
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "maris-test-sg_TF"
    Owner = "Maris Liepins"
  }
}