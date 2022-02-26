
variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t3.micro"
}

variable "instance_subnet" {
  type        = string
  description = ""
  default     = "subnet-0d89eba24a427e534"
}

variable "ami_os" {
  type        = string
  description = ""
  default     = "ubuntu"
}

variable "key_name" {}