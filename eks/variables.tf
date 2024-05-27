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

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "key_name" {
  description = "The SSH key name"
  type        = string
  default     = "srishti"
}



variable "vpc_name" {
  description = "VPC Name for the AWS account and region specified"
  type        = string
}

variable "subnet_tag" {
  description = "Tag used on subnets to define Tier"
  type        = string
  default     = "subnet_type"
}

variable "subnet_tag_value_public" {
  description = "Subnet tag value"
  type        = string
  default     = "public"
}

variable "subnet_tag_value_private" {
  description = "Subnet tag value"
  type        = string
  default     = "private"
}

variable "cluster_name" {
  type    = string
  default = "stage-cluster"
}
variable "custom_string" {
  type        = string
  default     = "aws"
  description = "random string for naming"
}




variable "min_size" {
  type        = number
  description = "minimum number of nodes that the group can scale in to"
  default     = 1
}

variable "max_size" {
  type        = number
  description = "maximum number of nodes that the group can scale out to"
  default     = 1
}

variable "desired_size" {
  type        = number
  description = "desired number of nodes that the group should launch with initially"
  default     = 1
}



