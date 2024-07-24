resource "aws_db_subnet_group" "rds" {
  name       = "rds-subnet-group"
  subnet_ids = var.public_subnets
}

resource "aws_security_group" "rds" {
  name   = "rds-security-group"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "rds_hackaton" {
  db_name                      = "mvp-hackaton"
  engine                       = var.engine_rds
  engine_version               = var.engine_version_rds
  identifier                   = "mvp-hackaton"
  username                     = var.rds_user
  password                     = var.rds_pass
  instance_class               = var.instance_class
  storage_type                 = var.storage_type
  allocated_storage            = var.min_storage
  max_allocated_storage        = var.max_storage
  multi_az                     = false
  vpc_security_group_ids       = [aws_security_group.rds.id]
  db_subnet_group_name         = aws_db_subnet_group.rds.id
  apply_immediately            = true
  skip_final_snapshot          = true
  publicly_accessible          = false
  deletion_protection          = false
  performance_insights_enabled = true
  backup_retention_period      = 1
  backup_window                = "00:00-01:00"
  copy_tags_to_snapshot        = true
  delete_automated_backups     = true
}

/* resource "aws_db_instance" "rds_card_encryptor" {
  db_name                      = "card_encryptor"
  engine                       = var.engine_rds
  engine_version               = var.engine_version_rds
  identifier                   = "card-encryptor"
  username                     = var.rds_user
  password                     = var.rds_pass
  instance_class               = var.instance_class
  storage_type                 = var.storage_type
  allocated_storage            = var.min_storage
  max_allocated_storage        = var.max_storage
  multi_az                     = false
  vpc_security_group_ids       = [aws_security_group.rds.id]
  db_subnet_group_name         = aws_db_subnet_group.rds.id
  apply_immediately            = true
  skip_final_snapshot          = true
  publicly_accessible          = false
  deletion_protection          = false
  performance_insights_enabled = true
  backup_retention_period      = 1
  backup_window                = "00:00-01:00"
  copy_tags_to_snapshot        = true
  delete_automated_backups     = true
}

resource "aws_db_instance" "rds_orders" {
  db_name                      = "orders"
  engine                       = var.engine_rds
  engine_version               = var.engine_version_rds
  identifier                   = "orders"
  username                     = var.rds_user
  password                     = var.rds_pass
  instance_class               = var.instance_class
  storage_type                 = var.storage_type
  allocated_storage            = var.min_storage
  max_allocated_storage        = var.max_storage
  multi_az                     = false
  vpc_security_group_ids       = [aws_security_group.rds.id]
  db_subnet_group_name         = aws_db_subnet_group.rds.id
  apply_immediately            = true
  skip_final_snapshot          = true
  publicly_accessible          = false
  deletion_protection          = false
  performance_insights_enabled = true
  backup_retention_period      = 1
  backup_window                = "00:00-01:00"
  copy_tags_to_snapshot        = true
  delete_automated_backups     = true
}

resource "aws_db_instance" "rds_payments" {
  db_name                      = "payments"
  engine                       = var.engine_rds
  engine_version               = var.engine_version_rds
  identifier                   = "payments"
  username                     = var.rds_user
  password                     = var.rds_pass
  instance_class               = var.instance_class
  storage_type                 = var.storage_type
  allocated_storage            = var.min_storage
  max_allocated_storage        = var.max_storage
  multi_az                     = false
  vpc_security_group_ids       = [aws_security_group.rds.id]
  db_subnet_group_name         = aws_db_subnet_group.rds.id
  apply_immediately            = true
  skip_final_snapshot          = true
  publicly_accessible          = false
  deletion_protection          = false
  performance_insights_enabled = true
  backup_retention_period      = 1
  backup_window                = "00:00-01:00"
  copy_tags_to_snapshot        = true
  delete_automated_backups     = true
}

resource "aws_db_instance" "rds_products" {
  db_name                      = "products"
  engine                       = var.engine_rds
  engine_version               = var.engine_version_rds
  identifier                   = "products"
  username                     = var.rds_user
  password                     = var.rds_pass
  instance_class               = var.instance_class
  storage_type                 = var.storage_type
  allocated_storage            = var.min_storage
  max_allocated_storage        = var.max_storage
  multi_az                     = false
  vpc_security_group_ids       = [aws_security_group.rds.id]
  db_subnet_group_name         = aws_db_subnet_group.rds.id
  apply_immediately            = true
  skip_final_snapshot          = true
  publicly_accessible          = false
  deletion_protection          = false
  performance_insights_enabled = true
  backup_retention_period      = 1
  backup_window                = "00:00-01:00"
  copy_tags_to_snapshot        = true
  delete_automated_backups     = true
}

resource "aws_db_instance" "rds_registration" {
  db_name                      = "registration"
  engine                       = var.engine_rds
  engine_version               = var.engine_version_rds
  identifier                   = "registration"
  username                     = var.rds_user
  password                     = var.rds_pass
  instance_class               = var.instance_class
  storage_type                 = var.storage_type
  allocated_storage            = var.min_storage
  max_allocated_storage        = var.max_storage
  multi_az                     = false
  vpc_security_group_ids       = [aws_security_group.rds.id]
  db_subnet_group_name         = aws_db_subnet_group.rds.id
  apply_immediately            = true
  skip_final_snapshot          = true
  publicly_accessible          = false
  deletion_protection          = false
  performance_insights_enabled = true
  backup_retention_period      = 1
  backup_window                = "00:00-01:00"
  copy_tags_to_snapshot        = true
  delete_automated_backups     = true
}
 */
