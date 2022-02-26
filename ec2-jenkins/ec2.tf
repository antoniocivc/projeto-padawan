resource "aws_instance" "web" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.instance_subnet
  key_name      = var.key_name
  vpc_security_group_ids = ["sg-84f010a3"]
  user_data     = "${file("install_jenkins_ubuntu.sh")}"
}