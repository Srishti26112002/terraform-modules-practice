# data source is used to fetch information

data "aws_region" "current" {}

data "aws_key_pair" "ssh_key_pair" {
  key_name = "srishti"
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


data "aws_subnets" "subnets" {

  # This filter ensures that only subnets within the specified VPC are retrieved.
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  # This filter selects subnets that have a specific tag with a given value. here subnet_type "private" tag is only filtered
  filter {
    name   = "tag:${var.subnet_tag}"
    values = [var.subnet_tag_value_private]
  }

  filter {
    name   = "tag:environment"
    values = [local.environment]
  }
}

