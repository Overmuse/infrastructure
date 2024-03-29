#
# EKS Worker Nodes Resources
#  * IAM role allowing Kubernetes actions to access other AWS services
#  * EKS Node Group to launch worker nodes
#

resource "aws_iam_role" "paper-trading-node" {
  name = "paper-trading-node"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "paper-trading-node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.paper-trading-node.name
}

resource "aws_iam_role_policy_attachment" "paper-trading-node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.paper-trading-node.name
}

resource "aws_iam_role_policy_attachment" "paper-trading-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.paper-trading-node.name
}

resource "aws_eks_node_group" "paper-trading" {
  cluster_name    = aws_eks_cluster.paper-trading.name
  node_group_name = "paper-trading"
  node_role_arn   = aws_iam_role.paper-trading-node.arn
  subnet_ids      = aws_subnet.paper-trading[*].id

  scaling_config {
    desired_size = 3
    max_size     = 3
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.paper-trading-node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.paper-trading-node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.paper-trading-node-AmazonEC2ContainerRegistryReadOnly,
  ]
}

