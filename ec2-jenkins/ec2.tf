#cria a EC2 passando o userdata definido nas variables
resource "aws_instance" "web" {
#  ami           = data.aws_ami.ubuntu.id
  ami            = data.aws_ami.jenkins.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.jenkins_public_subnet.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.ssh_jenkins.id]
  associate_public_ip_address = true
  tags          = var.tags 
  user_data     = "${file("${var.user_data}")}"
}