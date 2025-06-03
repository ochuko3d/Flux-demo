module "prod" {
  source              = "../../modules/kind"
  cluster_name        = "prod-cluster"
  github_org          = "ochuko3d"
  github_repository   = "flux-demo"
  flux_namespace      = "flux-system"
  test = "prod"
  github_token        = "var.github_token"
  enabled        = true
  git_repository = {
    url      = "https://github.com/ochuko3d/flux-demo"
    branch   = "prod"
    interval = "1m"
  }

}



