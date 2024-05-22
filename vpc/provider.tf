terraform {
  backend "s3" {
    bucket         = "terraform-backend-state"
    key            = "vpc/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    profile        = "srishti-self"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.49.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.aws_profile
  default_tags {
    tags = local.tags
  }
}
