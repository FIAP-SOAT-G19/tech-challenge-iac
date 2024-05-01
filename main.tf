module "network" {
  source = "./modules/network"
  region = var.region
}

module "rds-database" {
  source          = "./modules/rds-database"
  region          = var.region
  vpc_id          = module.network.vpc_id
  public_subnets  = module.network.public_subnets
  private_subnets = module.network.private_subnets
  rds_pass        = "postgres"
  rds_user        = "postgres"
}

module "eks" {
  source              = "./modules/eks"
  region              = var.region
  vpc_id              = module.network.vpc_id
  public_subnets      = module.network.public_subnets
  private_subnets     = module.network.private_subnets
  serviceaccount_name = "aws-iam-serviceaccount"
}

module "dynamo" {
  source     = "./modules/dynamo-database"
  table_name = "users"
}

module "sqs" {
  source = "./modules/sqs"
}
