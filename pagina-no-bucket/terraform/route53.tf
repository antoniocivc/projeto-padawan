#resource "aws_route53_zone" "this" {
#  name = "patomagico.com.br"
#}
#substituir o bloco data abaixo, pelo resource acima, e referenciar este último nos demais blocos
resource "aws_route53_zone" "this" { #data "aws_route53_zone" "this" {
  count = local.has_domain ? 1 : 0

  name = "${local.domain}."
}

resource "aws_route53_record" "website" {
  count = local.has_domain ? 1 : 0

  name    = local.domain
  type    = "A"
  zone_id = aws_route53_zone.this[0].zone_id

  alias {
    evaluate_target_health = false
    name                   = aws_cloudfront_distribution.this.domain_name
    zone_id                = aws_cloudfront_distribution.this.hosted_zone_id
  }
}

resource "aws_route53_record" "www" {
  count = local.has_domain ? 1 : 0

  #name    = "www.${local.domain}"
  name    = "www.${aws_cloudfront_origin_access_identity.origin_access_identity.comment}"
  type    = "A"
  zone_id = aws_route53_zone.this[0].zone_id

  alias {
  evaluate_target_health = false

  name                   = aws_route53_zone.this[0].name
  zone_id                = aws_route53_zone.this[0].zone_id

 
  }
}

resource "aws_route53_record" "cert_validation" {
  provider = aws
  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type

    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.this[0].zone_id

}