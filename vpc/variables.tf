variable "region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "aws_profile" {
  description = "The AWS CLI profile to use for creating resources"
  type        = string
  default     = "default"
}

variable "vpc_base_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "vpc-tf-stage"
}

variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Whether to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "Boolean to create a NAT Gateway in each Availability Zone"
  type        = bool
  default     = false
}


variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "private_subnets" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "private_subnet_tags" {
  description = "Tags to be attached to private subnets"
  type        = map(string)
  default = {
    subnet_type = "tf-private"
  }
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.1.11.0/24", "10.1.12.0/24"]
}

variable "public_subnet_tags" {
  description = "Tags to be attached to public subnets"
  type        = map(string)
  default = {
    subnet_type = "tf-public"
  }
}

variable "database_subnets" {
  description = "List of CIDR blocks for database subnets"
  type        = list(string)
  default     = ["10.1.21.0/24", "10.1.22.0/24"]
}

variable "database_subnets_tags" {
  description = "Tags to be attached to database subnets"
  type        = map(string)
  default = {
    subnet_type = "tf-database"
  }
}

