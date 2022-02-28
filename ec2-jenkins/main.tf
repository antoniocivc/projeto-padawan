#configuração padrão de ver~sao e provider da AWS, credenciais são passadas na pipeline ou via sistema
terraform {
  required_version = ">= 1.0.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.53.0"
    }
  }

}


provider "aws" {
  region = var.aws_region
  
}

#resource "local_file" "output_txt" {
#  filename = "output.txt"
#  content = aws_instance.web.public_dns
#}