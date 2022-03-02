terraform {
  required_version = ">= 1.1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.52.0"
    }
  }
   backend "s3" {
    profile = "pessoal"
    bucket = "tfstate-309950511952"
    key    = "pagina-no-bucket/tfstate"
    region = "us-east-1"
    dynamodb_table = "tflock-tfstate-309950511952"
 }
}

provider "aws" {
  region = "us-east-1"
  profile = "pessoal"
}

resource "random_pet" "website" {
  length = 5
}