variable "atlantis_public_subnet_id" {
    description = "The ID of the public subnet"
    type = string
}

variable "atlantis_public_dummy_subnet_id" {
    description = "The ID of the public dummy subnet"
    type = string
}

variable "atlantis_security_group_id" {
    description = "The ID of the security group"
    type = string
}

variable "github_app_pubkey" {
    description = "The public key of the GitHub App"
    type = string
}

variable "github_app_webhook_secret" {
    description = "The webhook secret of the GitHub App"
    type = string
}
