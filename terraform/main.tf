terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
    backend "s3" {
    # Replace this with your bucket name!
    bucket         = "maris-test-s3-bucket"
    key            = "tfstate/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "terraform-up-and-running-locks-maris"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-west-1"
}

module "vpc" {
  source      = "./modules/vpc"
}

module "maris-test-ec2instance" {
  source      = "./modules/EC2instance"
  instance_type = "t2.small"
  subnet_id_var = module.vpc.maris-test-subnet_id
  vpc_security_group_id_var = module.vpc.maris-test-sg_id
}