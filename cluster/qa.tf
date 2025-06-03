module "qa" {
  source              = "./modules/kind"
  cluster_name        = "qa-cluster"
  github_org          = "ochuko3d"
  github_repository   = "flux-demo"
  flux_namespace      = "flux-system"
  test = "qa"
  github_token        = "var.github_token"
  enabled        = true
  git_repository = {
    url      = "https://github.com/ochuko3d/flux-demo"
    branch   = "qa"
    interval = "1m"
  }

}
