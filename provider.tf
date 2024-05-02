terraform {
  backend "s3" {
    bucket = "terraform-tech-challeng-fiap-g19"
    key    = "infra-iac/terraform.tfstate"
    region = "us-east-1"
  }
}
