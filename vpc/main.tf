module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.2"

  name = var.vpc_name
  azs  = var.azs
  cidr = var.vpc_base_cidr

  enable_nat_gateway     = true
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  enable_vpn_gateway     = true
  enable_dns_hostnames   = var.enable_dns_hostnames
  enable_dns_support     = var.enable_dns_support

  private_subnets      = var.private_subnets
  private_subnet_tags  = var.private_subnet_tags
  public_subnets       = var.public_subnets
  public_subnet_tags   = var.public_subnet_tags
  database_subnets     = var.database_subnets
  database_subnet_tags = var.database_subnets_tags

  tags = local.tags
}


