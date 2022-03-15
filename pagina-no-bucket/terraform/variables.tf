variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "domain" {
  type        = string
  description = ""
  default     = ""
}

#variable "root" {
#  description = "Path to the directory that holds your public documents"
#  type        = string
#}

variable "index_document" {
  description = ""
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = ""
  type        = string
  default     = "404.html"
}

variable "additional_filetypes" {
  description = "Additional filetypes to sync to S3"
  type        = map(string)
  default     = {}
}

variable "filter_paths" {
  description = "If paths in the root folder should not be synced to S3, they can be specified here as a regular expression"
  type        = string
  default     = ""
}