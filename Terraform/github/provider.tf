terraform {
required_providers {
    github = {
      source = "integrations/github"
      version = "6.4.0"
        }
    }
}

# Confgiure the Github Provider
provider "github" {
    token = var.pat_token
}
