resource "aws_iam_user" "flux" {
    name = "flux"
}

resource "aws_iam_access_key" "flux" {
    user = aws_iam_user.flux.name
}

resource "aws_iam_policy" "flux" {
    name = "flux-policy"
    policy = templatefile("policies/flux.json", { region = var.region })
}

resource "aws_iam_policy_attachment" "flux-attach" {
    name = "flux-attachment"
    users = [aws_iam_user.flux.name]
    policy_arn = aws_iam_policy.flux.arn
}
