terraform {
  required_version = ">= 1.0.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.53.0"
    }
  }

  backend "s3" {
    bucket = "tfstate-309950511952"
    key    = "route53-/tfstate"
    region = "us-east-1"
    dynamodb_table = "tflock-tfstate-309950511952"
    profile = "pessoal"
 }

}

provider "aws" {
  region = var.aws_region
  profile = "pessoal"
}