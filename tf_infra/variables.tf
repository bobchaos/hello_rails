# General purpose vars
variable "name_prefix" {
  type        = string
  description = "Prepended to most asset names. Keep it short to avoid errors on some services, like a MySQL RDS instance"
  default     = "bobs"
}

variable "environment" {
  type        = string
  description = "Used in tags and some nomenclature, its intended to simplify using tools like terragrunt to duplicate the infra"
  default     = "dev"
}

# AWS provider vars
variable "primary_aws_region" {
  type        = string
  description = "the region where to spawn the bulk of the infra"
  default     = "us-east-1"
}

# vpc vars
variable "main_vpc_cidr" {
  type        = string
  description = "The CIDR block to assign to the main VPC."
  default     = "10.0.0.0/16"
}

variable "main_vpc_private_subnets" {
  type        = list(string)
  description = "A list of CIDRs to use for private subnets."
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "main_vpc_public_subnets" {
  type        = list(string)
  description = "A list of CIDRs to use for public subnets."
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "tags" {
  type        = map
  description = "tags to apply to all relevant assets"
  default     = {}
}

variable "zone_id" {
  type        = string
  description = "The zone to create r53 records in"
  default     = "Z2RQ53XGJPAY8L"
}

variable "certificate_arn" {
  type        = string
  description = "An ACM certificate ARN for use with the load balancer and protected assets"
  default     = "arn:aws:acm:us-east-1:943840344434:certificate/cf308c3c-9723-441a-bc45-7790df0f1920"
}
 variable "protect_assets" {
  type        = bool
  description = "Set to true to enable protection on key persistent assets, like the main database and EBS volumes"
  default     = false
}

variable "r53_zone_id" {
  type = string
  description = "A Route53 Zone ID to use for DNS records belonging to this stack"
  default = "Z2RQ53XGJPAY8L"
}
