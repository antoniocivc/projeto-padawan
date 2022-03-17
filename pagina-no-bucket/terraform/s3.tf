data "template_file" "s3-public-policy" {
  template = file("policy.json")
  vars     = { 
    bucket_name = local.domain 
    cdn_oai = aws_cloudfront_origin_access_identity.origin_access_identity.id
    }
}

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
}
