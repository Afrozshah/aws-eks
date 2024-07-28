module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eks-vpc"
  cidr = var.vpc_cidr

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets


  enable_dns_hostnames = true
  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
   "kubernetes.io/cluster/my-eks-cluster" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/roles/elb" = "shared"
 }
  private_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/roles/internal-elb" = "shared"
 }
}

###eks###

module "eks" {
  source  = "terraform-aws-modules/eks/aws"

  cluster_name    = "my-eks"
  cluster_version = "1.24"
  

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    nodes = {
        min_size = 1
        max_size = 3
        desired_size = 2
        instance_type = ["t2.micro"]
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}