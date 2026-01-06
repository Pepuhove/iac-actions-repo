terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.27.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.0.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.1.1"
    }
  }
# 
  backend "s3" {
    bucket         = "tic-tac-toe1214-bucket"
    key            = "terraform.tfstate"
    region         = "af-south-1"
    encrypt        = true
    # Enable S3 native state locking
    use_lockfile   = true 
  }
}

provider "aws" {
  region = var.aws_region
}
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

