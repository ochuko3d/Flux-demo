variable "environment" {
  description = "Environment name (e.g., dev, qa, prod)"
  type        = string
  default     = "dev"
}

variable "cluster_name" {
  description = "Name of the Kind cluster"
  type        = string
  default     = null # Will be constructed using environment if not provided
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

variable "github_bootstrap" {
  description = "Name of the GitHub repository"
  type        = string
  default     = "ppro"
}

variable "github_token" {
  description = "GitHub Personal Access Token for repository creation"
  type        = string
  sensitive   = true
}
