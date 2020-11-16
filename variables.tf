variable "allocated_storage" {
  default = 20
}
variable "storage_type" {
  default = "gp2"
}
variable "engine" {
  default = "mysql"
}
variable "engine_version" {
  default = "5.7"
}
variable "db_instance" {
  default = "db.t2.micro"
}
variable "name" {
  default = "myrdstestmysql"
}
variable "username" {
  default = "abc"
}
variable "password" {
  default = "abcXYZ123ZZZ"
}
variable "parameter_group_name" {
  default = "default.mysql5.7"
}

variable "allow_major_version_upgrade" {
  default = "true"
}
variable "auto_minor_version_upgrade" {
  default = "true"
}
variable "backup_retention_period" {
  default = 35
}
variable "backup_window" {
  default = "22:00-23:00"
}
variable "maintenance_window" {
  default = "Sat:00:00-Sat:03:00"
}
variable "publicly_accessible" {
  default = false
}
variable "multi_az" {
  default = true
}
variable "skip_final_snapshot" {
  default = true
}
variable "create_timeout" {
  default = "60m"
}
variable "delete_timeout" {
  default = "60m"
}
variable "update_timeout" {
  default = "60m"
}

variable "rds_subnet1" {
  default = "<your private subnet here>"
}

variable "rds_subnet2" {
  default = "<your private subnet here>"
}

variable "vpc_id" {
  default = "<your vpc id here>"
}
