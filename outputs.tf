output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "rds_address" {
  description = "RDS instance address"
  value       = module.rds-database.rds_address
  sensitive   = true
}
