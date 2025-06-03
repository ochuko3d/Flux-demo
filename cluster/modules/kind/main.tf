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

resource "kind_cluster" "this" {
  count          = var.enabled ? 1 : 0
  name           = format("%s-stage", var.cluster_name)
  node_image     = "kindest/node:v1.27.3"
  wait_for_ready = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    networking {
      kube_proxy_mode = "ipvs"
    }

    node {
      role = "control-plane"
      kubeadm_config_patches = [
        "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
      ]
    }

    node {
      role = "worker"
    }
  }
}


provider "kubernetes" {
  host                   = length(kind_cluster.this) > 0 ? kind_cluster.this[0].endpoint : null
  client_certificate     = length(kind_cluster.this) > 0 ? kind_cluster.this[0].client_certificate : null
  client_key             = length(kind_cluster.this) > 0 ? kind_cluster.this[0].client_key : null
  cluster_ca_certificate = length(kind_cluster.this) > 0 ? kind_cluster.this[0].cluster_ca_certificate : null
}

provider "flux" {
  kubernetes = {
    host                   = length(kind_cluster.this) > 0 ? kind_cluster.this[0].endpoint : null
    client_certificate     = length(kind_cluster.this) > 0 ? kind_cluster.this[0].client_certificate : null
    client_key             = length(kind_cluster.this) > 0 ? kind_cluster.this[0].client_key : null
    cluster_ca_certificate = length(kind_cluster.this) > 0 ? kind_cluster.this[0].cluster_ca_certificate : null
  }
  git = {
    url = "https://github.com/${var.github_org}/${var.github_repository}.git"
    http = {
      username = "git"
      password = var.github_token
    }
  }
}


provider "github" {
  owner = var.github_org
  token = var.github_token
}

resource "kubernetes_namespace" "this" {
  count = var.enabled ? 1 : 0
  metadata {
    name = var.flux_namespace
  }

  timeouts {
    delete = "2m"
  }

  lifecycle {
    ignore_changes = [metadata]
  }
}

resource "kubernetes_namespace" "that" {
  count = var.enabled ? 1 : 0
  metadata {
    name = var.test
  }
}

resource "flux_bootstrap_git" "this" {
  count = var.enabled ? 1 : 0
  depends_on = [
    kubernetes_namespace.this,
    kind_cluster.this[0]
  ]

  embedded_manifests = true
  path               = "${var.test}/${var.cluster_name}"
  components_extra   = ["image-reflector-controller", "image-automation-controller"]
}

