locals {
  has_domain      = var.domain != ""
  domain          = local.has_domain ? var.domain : random_pet.website.id
  regional_domain = module.website.regional_domain_name
  common_tags = {
    Name         = "Jenkins"
    Managed_by   = "Terraform"    
  }
}