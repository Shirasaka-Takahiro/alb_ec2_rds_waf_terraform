##General Config
variable "general_config" {
  type = map(any)
}
variable "regions" {
  type = map(any)
}

##Network
variable "vpc_cidr" {}
variable "availability_zones" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "public_subnet_ids" {}
variable "private_subnet_ids" {}

##EC2 Instance
variable "ami" {}
variable "instance_type" {}
variable "volume_type" {}
variable "volume_size" {}
variable "key_name" {}
variable "instance_id" {}
variable "public_key_path_web" {}

##Web ACL
variable "webacl_scope" {}

##RDS
variable "engine_name" {}
variable "major_engine_version" {}
variable "engine" {}
variable "engine_version" {}
variable "username" {}
variable "password" {}
variable "instance_class" {}
variable "storage_type" {}
variable "allocated_storage" {}
variable "multi_az" {}

##SNS
variable "sns_email" {}

##Cloud Watch
variable "cwa_actions" {}
variable "cwa_threshold_rds_freeablememory" {}
variable "cwa_threshold_rds_freeablestorage" {}