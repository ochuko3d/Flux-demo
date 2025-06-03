output "cluster_name" {
  description = "The name of the created Kind cluster"
  value       = kind_cluster.this[0].name
}

output "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  value       = kind_cluster.this[0].kubeconfig_path
}

output "endpoint" {
  description = "Kubernetes API endpoint"
  value       = kind_cluster.this[0].endpoint
}

output "client_certificate" {
  description = "Client certificate for authenticating to the cluster"
  value       = kind_cluster.this[0].client_certificate
  sensitive   = true
}

output "client_key" {
  description = "Client key for authenticating to the cluster"
  value       = kind_cluster.this[0].client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Cluster CA certificate"
  value       = kind_cluster.this[0].cluster_ca_certificate
  sensitive   = true
}
