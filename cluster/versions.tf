terraform {
  required_providers {
    kind = {
      source  = "registry.opentofu.org/tehcyx/kind"
      version = "0.2.1"
    }
    kubernetes = {
      source  = "registry.opentofu.org/hashicorp/kubernetes"
      version = "2.23.0"
    }
    flux = {
      source  = "fluxcd/flux"
      version = "1.5.1"
    }
  }
  required_version = ">= 1.6.0"
}
