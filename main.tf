resource "aws_db_instance" "rds" {
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.db_instance
  name                 = var.name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  #will assign subnets for rds mysql instances
  db_subnet_group_name = "${aws_db_subnet_group.rds-private-subnet.name}"
  # will assign security grp and allow access on port 3306
  vpc_security_group_ids      = ["${aws_security_group.rds-sg.id}"]
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  #rentention period for backups
  backup_retention_period = var.backup_retention_period
  #back up window
  backup_window = var.backup_window
  #maintenance window
  maintenance_window = var.maintenance_window
  #whether the rds is publicly accessibe or not. accepts boolean value. Set to false for enhance security.
  publicly_accessible = var.publicly_accessible
  #Specifies if the RDS instance is multi-AZ
  multi_az            = var.multi_az
  skip_final_snapshot = var.skip_final_snapshot
  timeouts {
    create = var.create_timeout
    delete = var.delete_timeout
    update = var.update_timeout
  }
}

#private subnet group for rds mysql instances
resource "aws_db_subnet_group" "rds-private-subnet" {
  name       = "rds-private-subnet-group"
  subnet_ids = ["${var.rds_subnet1}", "${var.rds_subnet2}"]
}

#Create a Security Group to allow mysql port 3306
resource "aws_security_group" "rds-sg" {
  name   = "my-rds-sg"
  vpc_id = var.vpc_id

}

# Ingress Security Port 3306
resource "aws_security_group_rule" "mysql_inbound_access" {
  from_port         = 3306
  protocol          = "tcp"
  security_group_id = "${aws_security_group.rds-sg.id}"
  to_port           = 3306
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}
