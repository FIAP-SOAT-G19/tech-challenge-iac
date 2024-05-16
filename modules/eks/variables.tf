variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "cluster_name" {
  default = "eks_cluster_tech_challenge"
}

variable "kubernetes_version" {
  default = "1.29"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
}

variable "serviceaccount_name" {
  description = "A service account provides an identity for processes that run in a Pod, and maps to a ServiceAccount object."
  default     = "aws-iam-serviceaccount"
  type        = string
}
