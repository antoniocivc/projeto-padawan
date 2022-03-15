data "template_file" "s3-public-policy" {
  template = file("policy.json")
  vars     = { 
    bucket_name = local.domain 
    cdn_oai = aws_cloudfront_origin_access_identity.origin_access_identity.id
    }
}

#module "logs" {
#  source        = "github.com/chgasparoto/terraform-s3-object-notification"
#  name          = "${local.domain}-logs"
#  acl           = "log-delivery-write"
#  force_destroy = !local.has_domain
#  tags          = local.common_tags
#}

module "website" {
  source        = "github.com/chgasparoto/terraform-s3-object-notification"
  name          = local.domain
  acl           = "private"
 
  policy        = data.template_file.s3-public-policy.rendered

  force_destroy = !local.has_domain
  tags          = local.common_tags
  versioning = {
    enabled = true
  }

  filepath = "${path.module}/../website/"
  website = {
    index_document = "index.html"
    error_document = "index.html"
  }

#  logging = {
#    target_bucket = module.logs.name
#    target_prefix = "access/"
#  }
}

#module "redirect" {
#  source        = "github.com/chgasparoto/terraform-s3-object-notification"
#  name          = "www.${local.domain}"
#  acl           = "public-read"
#  force_destroy = !local.has_domain
#  tags          = local.common_tags
#  website = {
#    redirect_all_requests_to = local.has_domain ? var.domain : module.website.website
#  }
#}

resource "aws_s3_bucket_public_access_block" "block_public_s3" {
  bucket = module.website.website

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}