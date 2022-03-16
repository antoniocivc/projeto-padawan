#pega uma ami da amazon, no caso ubuntu mais recente
data "aws_ami" "ubuntu" {
  owners      = ["amazon"]
  most_recent = true
  name_regex  = var.ami_os

#filtra a arquitetura da ami para x86_64
filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

#pega a minha ami jenkins mais recente
data "aws_ami" "jenkins" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "AMI-J"
  owners           = ["self"]


#pega o IP publico para ser usado no security group
data "http" "ip" {
  url = "https://ifconfig.me"
}

data "aws_caller_identity" "current" {}