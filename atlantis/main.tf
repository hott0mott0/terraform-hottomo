# Network
module "network" {
  source = "./modules/network"
}

# ECS
module "ecs" {
  source = "./modules/ecs"

  atlantis_public_subnet_id       = module.network.atlantis_public_subnet_id
  atlantis_public_dummy_subnet_id = module.network.atlantis_public_dummy_subnet_id
  atlantis_security_group_id      = module.network.atlantis_security_group_id

  github_app_pubkey         = module.secret.github_app_pubkey
  github_app_webhook_secret = module.secret.github_app_webhook_secret
}

# Application Load Balancer
module "alb" {
  source = "./modules/alb"

  atlantis_vpc_id                 = module.network.atlantis_vpc_id
  atlantis_public_subnet_id       = module.network.atlantis_public_subnet_id
  atlantis_public_dummy_subnet_id = module.network.atlantis_public_dummy_subnet_id
  atlantis_security_group_id      = module.network.atlantis_security_group_id
}

# Secret
module "secret" {
  source = "./modules/secret"
}
