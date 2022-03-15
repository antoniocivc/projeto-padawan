locals {
  has_domain      = var.domain != ""
  domain          = local.has_domain ? var.domain : ""
  
  common_tags = {
    Name         = "Projeto_Padawan"
    Managed_by   = "Terraform"    
  }
}