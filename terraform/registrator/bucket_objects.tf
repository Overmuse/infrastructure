resource "aws_s3_bucket_object" "bootstrap" {
  bucket = aws_s3_bucket.registrator_config.id
  key = "bootstrap"
  content = templatefile("files/bootstrap", {user = "ubuntu", bucket = aws_s3_bucket.registrator_config.id})
}

resource "aws_s3_bucket_object" "dockerfile" {
  bucket = aws_s3_bucket.registrator_config.id
  key = "Dockerfile"
  content = templatefile("files/Dockerfile", {})
}

resource "aws_s3_bucket_object" "docker_compose_yml" {
  bucket = aws_s3_bucket.registrator_config.id
  key = "docker-compose.yml"
  content = templatefile("files/docker-compose.yml", {})
}

resource "aws_s3_bucket_object" "commentbot_config_tpl" {
  bucket = aws_s3_bucket.registrator_config.id
  key = "config.commentbot.tpl"
  content = templatefile("files/config.commentbot.tpl", {})
}

resource "aws_s3_bucket_object" "regservice_config_toml" {
  bucket = aws_s3_bucket.registrator_config.id
  key = "config.regservice.toml"
  content = templatefile("files/config.regservice.toml", {})
}

resource "aws_s3_bucket_object" "commentbot_sh" {
  bucket = aws_s3_bucket.registrator_config.id
  key = "commentbot.sh"
  content = templatefile("files/commentbot.sh", {})
}

resource "aws_s3_bucket_object" "regservice_sh" {
  bucket = aws_s3_bucket.registrator_config.id
  key = "regservice.sh"
  content = templatefile("files/regservice.sh", {})
}

resource "aws_s3_bucket_object" "private_key" {
  bucket = aws_s3_bucket.registrator_config.id
  key = "private-key.tpl"
  content = templatefile("files/private-key.tpl", {})
}

resource "aws_s3_bucket_object" "gitconfig" {
  bucket = aws_s3_bucket.registrator_config.id
  key = "gitconfig"
  content = templatefile("files/gitconfig", {})
}

resource "aws_s3_bucket_object" "git_credentials_tpl" {
  bucket = aws_s3_bucket.registrator_config.id
  key = "git-credentials.tpl"
  content = templatefile("files/git-credentials.tpl", {})
}
