module "aws_prod" {
  source        = "../../infra"
  instance      = "t2.micro"
  aws_region    = "us-east-2"
  ssh-key       = "iac_alura_prod"
  instance_name = "Production Server"
}


output "IP" {
  value = module.aws_prod.server_public_ip
}
output "DNS" {
  value = module.aws_prod.server_public_dns
}