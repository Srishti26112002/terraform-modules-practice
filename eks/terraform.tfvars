region                   = "ap-south-1"
aws_profile              = "srishti-prsnl-prac"
azs                      = ["ap-south-1a", "ap-south-1b"]
vpc_name                 = "terraform-vpc-1"
cluster_name             = "stage-cluster"
key_name                 = "srishti-keypair"
subnet_tag               = "subnet_type"
subnet_tag_value_private = "tf-private"
min_size                 = 1
max_size                 = 1
desired_size             = 1