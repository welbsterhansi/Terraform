module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.name
  cluster_version = "1.18"
  subnets         = module.vpc.private_subnets

  tags = {
    Environment = "challenge-welbster"
    GithubRepo  = "devops"
    GithubOrg   = "Atlantic"
  }

  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-g1"
      instance_type                 = "t2.small"
      additional_userdata           = "Small Server"
      asg_max_size                  = 5
      asg_min_size                  = 2
      asg_desired_capacity          = 2
      additional_security_group_ids = [aws_security_group.worker_group_mgmt.id]
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

resource "helm_release" "kube_state_metrics" {
  chart      = "kube-state-metrics"
  namespace  = "kube-system"
  name       = "metrics"
  version    = "1.2.3"
  repository = "https://charts.bitnami.com/bitnami"
  
}

resource "kubernetes_namespace" "example" {
  metadata {
    
    name = "monitoring-system"
  }
  
}
resource "helm_release" "prometheus" {
  name       = "prometheus"
  chart      = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  version    = "13.2.1"
  namespace  = "monitoring-system"

  set {
        name  = "server.service.type"
        value = "LoadBalancer"
    }
  
  }
