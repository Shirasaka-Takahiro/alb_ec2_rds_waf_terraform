output "public_subnet_ids" {
  value = module.prod.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.prod.private_subnet_ids
}

output "instance_id" {
  value = module.prod.instance_id
}

output "public_ip" {
  value = module.prod.public_ip
}

output "alb_dns_name" {
  value = module.prod.alb_dns_name
}

output "rds_endpoint" {
  value = module.prod.rds_endpoint
}