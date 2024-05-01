output "name" {
  description = "RDS instance name"
  value       = aws_db_instance.rds.db_name
}

output "rds_address" {
  description = "RDS instance address"
  value       = aws_db_instance.rds.address
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.rds.port
}
