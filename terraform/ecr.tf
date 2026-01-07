module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "3.1.0"

  repository_name    = var.ecr_repo
  registry_scan_type = "BASIC"
  repository_type    = "private"

  create_lifecycle_policy = false

  tags = {
    Terraform = "true"
  }
}
