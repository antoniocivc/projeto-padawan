# Criação da VPC
resource "aws_vpc" "jenkins_vpc" {
  cidr_block = "50.0.0.0/16"
  enable_dns_hostnames = true
  
  tags = var.tags
}

# Criação da Subnet Pública
resource "aws_subnet" "jenkins_public_subnet" {
  vpc_id     = aws_vpc.jenkins_vpc.id
  cidr_block = "50.0.1.0/24"

  tags = var.tags
}

# Criação do Internet Gateway
resource "aws_internet_gateway" "jenkins_igw" {
  vpc_id = aws_vpc.jenkins_vpc.id

  tags = var.tags
}

# Criação da Tabela de Roteamento
resource "aws_route_table" "jenkins_rt" {
  vpc_id = aws_vpc.jenkins_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins_igw.id
  }

  tags = var.tags
}

# Criação da Rota Default para Acesso à Internet
resource "aws_route" "jenkins_routetointernet" {
  route_table_id            = aws_route_table.jenkins_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.jenkins_igw.id
}

# Associação da Subnet Pública com a Tabela de Roteamento
resource "aws_route_table_association" "jenkins_pub_association" {
  subnet_id      = aws_subnet.jenkins_public_subnet.id
  route_table_id = aws_route_table.jenkins_rt.id
}