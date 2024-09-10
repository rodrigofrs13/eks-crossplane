locals{
  argocd_namespace = "argocd" 
  environment     = "hub"
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = local.argocd_namespace
  }
}
################################################################################
# GitOps Bridge: Bootstrap
################################################################################
module "gitops_bridge_bootstrap" {
  source  = "gitops-bridge-dev/gitops-bridge/helm"
  version = "0.0.1"
  cluster = {
    cluster_name = module.eks.cluster_name
    environment  = local.environment
    #enablemetadata metadata     = local.addons_metadata
    #enablemetadata addons       = local.addons
  }
  #enableapps apps = local.argocd_apps
  argocd = {
    namespace        = local.argocd_namespace
    chart_version    = "6.7.12"
    timeout          = 600
    create_namespace = false
    set = [
      {
        name  = "server.service.type"
        value = "LoadBalancer"
      }
    ]
  }
  
}