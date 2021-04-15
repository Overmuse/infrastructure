output "access_key_id" {
    value = aws_iam_access_key.flux.id
    sensitive = true
}

// TODO: encrypt this with a keybase pgp key
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key
output "secret_key" {
    value = aws_iam_access_key.flux.secret
    sensitive = true
}
