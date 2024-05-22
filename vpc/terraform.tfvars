region                 = "ap-south-1"
aws_profile            = "srishti-prsnl-prac"
vpc_base_cidr          = "10.1.0.0/16"
vpc_name               = "terraform-vpc-1"
enable_dns_hostnames   = true
one_nat_gateway_per_az = false
enable_dns_support     = true
azs                    = ["ap-south-1a", "ap-south-1b"]
private_subnets        = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_tags = {
  subnet_type = "tf-private"
}
public_subnets = ["10.1.11.0/24", "10.1.12.0/24"]
public_subnet_tags = {
  subnet_type = "tf-public"
}
database_subnets = ["10.1.21.0/24", "10.1.22.0/24"]
database_subnets_tags = {
  subnet_type = "tf-database"
}
