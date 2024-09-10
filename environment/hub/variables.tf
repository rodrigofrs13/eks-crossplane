variable "kubernetes_version" {
  description = "EKS version"
  type        = string
  default     = ""
}


variable "cluster_name" {
  description = "EKS version"
  type        = string
  default     = ""
}

variable "eks_admin_role_name" {
  description = "EKS admin role"
  type        = string
  default     = ""
}

variable "addons" {
  description = "EKS addons"
  type        = any
  default = {
    enable_aws_load_balancer_controller = false
    enable_aws_argocd = false
  }
}

variable "authentication_mode" {
  description = "The authentication mode for the cluster. Valid values are CONFIG_MAP, API or API_AND_CONFIG_MAP"
  type        = string
  default     = "API_AND_CONFIG_MAP"
}