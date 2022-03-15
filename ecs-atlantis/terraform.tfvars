# VPC - use these parameters to create new VPC resources
cidr = "60.10.0.0/16"

azs = ["us-east-1a", "us-east-1b"]

private_subnets = ["60.10.1.0/24", "60.10.2.0/24"]

public_subnets = ["60.10.11.0/24", "60.10.12.0/24"]

# VPC - use these parameters to use existing VPC resources
# vpc_id = "vpc-1651acf1"
# private_subnet_ids = ["subnet-1fe3d837", "subnet-129d66ab"]
# public_subnet_ids = ["subnet-1211eef5", "subnet-163466ab"]

# DNS
route53_zone_name = "patomagico.com.br"

# ACM (SSL certificate)
# Specify ARN of an existing certificate or new one will be created and validated using Route53 DNS:
# certificate_arn = "arn:aws:acm:eu-west-1:135367859851:certificate/70e008e1-c0e1-4c7e-9670-7bb5bd4f5a84"

# ECS Service and Task
ecs_service_assign_public_ip = true

# Atlantis
atlantis_repo_allowlist = ["github.com/terraform-aws-modules/*", "github.com/antoniocivc/*"]

# Specify one of the following block.
# For Github
atlantis_github_user = "kingaquaman"
atlantis_github_user_token = "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"

# For Gitlab
atlantis_gitlab_user = ""
atlantis_gitlab_user_token = ""

# For Bitbucket
atlantis_bitbucket_user = ""
atlantis_bitbucket_user_token = ""

# For Bitbucket on prem (Stash)
# atlantis_bitbucket_base_url = ""

# Tags
tags = {
  Name = "atlantis"
}
