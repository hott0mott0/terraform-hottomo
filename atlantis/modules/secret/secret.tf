data "aws_secretsmanager_secret" "github_app_pubkey" {
  name = "github_app/pubkey"
}

data "aws_secretsmanager_secret_version" "github_app_pubkey_version" {
  secret_id = data.aws_secretsmanager_secret.github_app_pubkey.id
}

data "aws_secretsmanager_secret" "github_app_webhook_secret" {
  name = "github_app/webhook_secret"
}

data "aws_secretsmanager_secret_version" "github_app_webhook_secret_version" {
  secret_id = data.aws_secretsmanager_secret.github_app_webhook_secret.id
}
