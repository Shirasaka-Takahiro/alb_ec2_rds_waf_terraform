provider "aws" {
  profile = "terraform-user"
  region  = var.regions["tokyo"]
}

terraform {
  required_version = "~> 1.3.6"
  #backend "s3" {
  #  bucket  = "example-prod-tfstate-bucket"
  #  region  = "ap-northeast-1"
  #  key     = "prod.tfstate"
  #  profile = "terraform-user"
  #}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }
}

module "prod" {
  source = "../../module"

  general_config       = var.general_config
  regions              = var.regions
  availability_zones   = var.availability_zones
  vpc_cidr             = var.vpc_cidr
  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
  public_subnet_ids    = module.prod.public_subnet_ids
  private_subnet_ids   = module.prod.private_subnet_ids
  ami                  = var.ami
  key_name             = var.key_name
  instance_type        = var.instance_type
  volume_type          = var.volume_type
  volume_size          = var.volume_size
  instance_id          = module.prod.instance_id
  public_key_path_web  = var.public_key_path_web
  webacl_scope         = var.webacl_scope
  engine_name          = var.engine_name
  major_engine_version = var.major_engine_version
  engine               = var.engine
  engine_version       = var.engine_version
  username             = var.username
  password             = var.password
  instance_class       = var.instance_class
  storage_type         = var.storage_type
  allocated_storage    = var.allocated_storage
  multi_az             = var.multi_az
  sns_email                         = var.sns_email
  cwa_actions                       = var.cwa_actions
  cwa_threshold_rds_freeablememory  = var.cwa_threshold_rds_freeablememory
  cwa_threshold_rds_freeablestorage = var.cwa_threshold_rds_freeablestorage
}