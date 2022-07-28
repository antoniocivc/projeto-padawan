#cria o par de chaves para ser usado na AWS e salva o .pem localmente
#cria a private key
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

#cria o par de keys para AWS
resource "aws_key_pair" "kp" {
  key_name   = var.key_name      # Create a "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh
}

# #salva localmente o .pem
resource "local_file" "ssh_key" {
  filename = "./keys/${aws_key_pair.kp.key_name}.pem"
  file_permission = "400"
  directory_permission = "700"
  content = tls_private_key.pk.private_key_pem
}