data "aws_ami" "ubuntu" {
  owners      = ["amazon"]
  most_recent = true
  name_regex  = var.ami_os

filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}
