#cria o security_group para a instancia
resource "aws_security_group" "ssh_jenkins" {
  name        = "permitir_ssh_jenkins"
  description = "Permite SSH e 8080 na EC2"
  vpc_id      = aws_vpc.jenkins_vpc.id
#gera o ingress para o ssh na porta 22, permitido para o ip publico
  ingress {
    description = "SSH to EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/32"]
    #cidr_blocks = ["${data.http.ip.body}/32"]
  }
#gera o ingress para o ssh na porta 8080, permitido para o ip publico
  ingress {
    description = "jenkins to EC2"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/32"]
    #cidr_blocks = ["${data.http.ip.body}/32"]
  }
#gera o egress para toda internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
#adiciona as tags
  tags = var.tags
}