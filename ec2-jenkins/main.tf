#configuração padrão de ver~sao e provider da AWS, credenciais são passadas na pipeline ou via sistema
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
    key    = "ec2-jenkins/tfstate"
    region = "us-east-1"
    dynamodb_table = "tflock-tfstate-309950511952"
 }

}

provider "aws" {
  region = var.aws_region
  
}





#resource "local_file" "output_txt" {
#  filename = "output.txt"
#  content = aws_instance.web.public_dns
#}