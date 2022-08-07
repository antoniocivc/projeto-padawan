output "id" {
  description = "exibe o id da instancia"
  value = aws_instance.web.id
}

output "ami" {
  description = "exibe o id da ami usada"
  value = aws_instance.web.ami
}

output "arn" {
  description = "exibe o arn da instancia"
  value = aws_instance.web.arn
}

output "public-dns" {
  description = "exibe o dns publico da instancia"
  value = aws_instance.web.public_dns
}

output "ssh_key" {
  description = "exibe o nome da key_pair gerada"
  value       = var.key_name
}

# output "ip" {
#   description = "exibe o ip publico usado para o security_group ingress"
#   value = data.http.ip.body
# }