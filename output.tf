output "aws_rds_address" {
  value = aws_db_instance.rds.address
}

output "aws_rds_arn" {
  value = aws_db_instance.rds.arn
}

output "aws_rds_engine" {
  value = aws_db_instance.rds.engine
}

output "aws_rds_engine_version" {
  value = aws_db_instance.rds.engine_version
}

output "aws_rds_backup_retention_period" {
  value = aws_db_instance.rds.backup_retention_period
}

output "aws_rds_resource_id" {
  value = aws_db_instance.rds.resource_id
}
