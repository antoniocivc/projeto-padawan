resource "aws_acm_certificate" "this" {
  
  provider                  = aws
  #domain_name               = "www.${local.domain}"
  domain_name               = local.domain
  validation_method         = "DNS"
  subject_alternative_names = ["*.${local.domain}", "www.${local.domain}"]
}

resource "aws_acm_certificate_validation" "this" {
  provider                = aws
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}