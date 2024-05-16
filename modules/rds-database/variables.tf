variable "region" {
  description = "The default region to use for the AWS provider"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "public_subnets" {
  description = "A list of public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnets"
  type        = list(string)
}

variable "engine_rds" {
  description = "The engine for the RDS instance"
  default     = "postgres"
}

variable "engine_version_rds" {
  description = "The engine version for the RDS instance"
  default     = "14.11"
}

variable "rds_user" {
  description = "The username for the RDS instance"
  type        = string
}

variable "rds_pass" {
  description = "The password for the RDS instance"
  type        = string
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
  default     = "db.t3.micro"
}

variable "storage_type" {
  description = "The storage type for the RDS instance"
  default     = "gp3"
}

variable "min_storage" {
  description = "The minimum storage for the RDS instance"
  default     = "20"
}

variable "max_storage" {
  description = "The maximum storage for the RDS instance"
  default     = "30"
}
