output "configure_kubectl" {
  description = "Configure kubectl: make sure you're logged in with the correct AWS profile and run the following command to update your kubeconfig"
  value       = <<-EOT
    aws eks --region ${local.region} update-kubeconfig --name ${module.eks.cluster_name} --alias hub
  EOT
}

output "cluster_name" {
  description = "Cluster Hub name"
  value       = module.eks.cluster_name
}
output "cluster_endpoint" {
  description = "Cluster Hub endpoint"
  value       = module.eks.cluster_endpoint
}
output "cluster_certificate_authority_data" {
  description = "Cluster Hub certificate_authority_data"
  value       = module.eks.cluster_certificate_authority_data
}
output "cluster_region" {
  description = "Cluster Hub region"
  value       = local.region
}
output "hub_node_security_group_id" {
  description = "Cluster Hub region"
  value       = module.eks.node_security_group_id
}