variable "naming_prefix" {
  type        = string
  description = "Three letter prefix for naming things"

}

variable "aws_region" {
  type        = string
  description = "AWS region to deploy to"
  default     = "us-west-2"
}

