data "aws_region" "current" {}

data "aws_key_pair" "ssh_key_pair" {
  key_name = "srishti-keypair"
  filter {
    name   = "tag:environment"
    values = [local.environment]
  }
}

data "aws_vpc" "vpc" {
  state = "available"

  tags = {
    "Name" = var.vpc_name
  }
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "tag:${var.subnet_tag}"
    values = [var.subnet_tag_value_private]
  }

  filter {
    name   = "tag:environment"
    values = [local.environment]
  }
}

