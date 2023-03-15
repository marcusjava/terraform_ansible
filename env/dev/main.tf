module "aws_dev" {
  source        = "../../infra"
  instance      = "t2.micro"
  aws_region    = "us-east-2"
  ssh-key       = "iac_alura_dev"
  instance_name = "Development Server"
}

output "IP" {
  value = module.aws_dev.server_public_ip
}

output "DNS" {
  value = module.aws_dev.server_public_dns
}