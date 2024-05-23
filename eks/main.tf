module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "eks-cluster-stage"
  cluster_version = "1.28"

  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id = data.aws_vpc.vpc.id
  # subnet_ids = data.aws_subnets.subnets.ids
  subnet_ids = data.aws_subnets.private_subnets.ids


  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type                   = "AL2_x86_64"
    instance_types             = ["t2.micro"]
    iam_role_attach_cni_policy = true
  }

  eks_managed_node_groups = {
    example = {
      instance_types = ["t2.micro"]
      capacity_type  = "SPOT"

      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      key_name = data.aws_key_pair.ssh_key_pair.key_name
      labels = {
        node = "worker"
      }
      update_config = {
        max_unavailable_percentage = 50
      }



      tags = local.tags
    }
  }

  tags = {
    "Name" = "${var.cluster_name}-${local.environment}"
  }
}





resource "aws_security_group" "eks_ssh" {
  description = "EKS SG for ssh internally"
  name        = "${var.cluster_name}-${local.environment}-eks-ng-sg"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.vpc.cidr_block]
  }

  ingress {
    description = "All traffic between EKS nodes"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.cluster_name}-${local.environment}-eks-ng-sg"
  }
}




# Local Values in Terraform
locals {
  owners      = "srishti"
  environment = "stage"

  tags = {
    Terraform   = "true"
    owners      = local.owners
    environment = local.environment

  }
}


