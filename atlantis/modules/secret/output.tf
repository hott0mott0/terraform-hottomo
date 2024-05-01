output "github_app_pubkey" {
    value = data.aws_secretsmanager_secret_version.github_app_pubkey_version.secret_binary
}

output "github_app_webhook_secret" {
    value = data.aws_secretsmanager_secret_version.github_app_webhook_secret_version.secret_string
}
