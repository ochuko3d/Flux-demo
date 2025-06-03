terraform {
  backend "local" {
    path = "terraform.tfstate"
    workspace_dir = "terraform.tfstate.d"
  }
}
