module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name                             = "my-python-app-cluster"
  cluster_version                          = "1.29"
  vpc_id                                   = aws_vpc.main.id
  subnet_ids                               = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  authentication_mode                      = "API_AND_CONFIG_MAP"
  enable_cluster_creator_admin_permissions = true
  cluster_endpoint_public_access           = true

  # Managed Node Groups configuration
  eks_managed_node_groups = {
    general = {

      # m6a.large is great, but t3.medium is the smallest recommended for EKS.
      instance_types = ["t3.medium"]

      min_size     = 2
      max_size     = 3
      desired_size = 2

      subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]

      capacity_type = "ON_DEMAND"
    }
  }

  tags = {
    Environment = "production"
    Application = "python-ip-app"
  }
}