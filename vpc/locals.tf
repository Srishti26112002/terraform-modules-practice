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
