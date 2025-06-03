variable "cluster_name" {
  description = "Name of the Kind cluster"
  type        = string
  default     = ""
}

variable "flux_bootstrap_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = ""
}

variable "github_org" {
  description = "GitHub organization or username"
  type        = string
  default     = "ochuko3d"
}

variable "github_repository" {
  description = "Name of the GitHub repository"
  type        = string
  default     = "ppro"
}


variable "github_token" {
  description = "GitHub Personal Access Token for repository creation"
  type        = string
  sensitive   = true
}


variable "flux_namespace" {
  description = "GitHub Personal Access Token for repository creation"
  type        = string
}

variable "test" {
  description = "GitHub Personal Access Token for repository creation"
  type        = string
}

variable "git_repository" {
  type = object({
    url      = string
    branch   = string
    interval = string
  })
  description = "Git repository configuration for Flux"
}

variable "enabled" {
  description = "Enable or disable this cluster and all related resources"
  type        = bool
  default     = true
}