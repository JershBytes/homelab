resource "github_repository" "example_repo" {
    name        = "example_repo"
    description = "My awesome codebase"

    visibility = "public"
}