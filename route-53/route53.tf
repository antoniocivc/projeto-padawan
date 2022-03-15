resource "aws_route53_zone" "zone" { 
  count = local.has_domain ? 1 : 0
  name = "${local.domain}."
  tags = local.common_tags
}