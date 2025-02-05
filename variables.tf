variable "repository" {
  type        = string
  description = "The name of the GitHub repository where the GitHub Actions workflow YAML file will be created."
}
variable "branch" {
  type        = string
  description = "The branch of the GitHub repository where the workflow YAML file will be committed."
}
variable "commit_user" {
  type = object({
    name  = string
    email = string
  })
  description = <<DESCRIPTION
The GitHub identity used to commit the workflow YAML file to the repository.

This includes:
- **name**: The name of the user committing the workflow file.
- **email**: The email address of the user committing the workflow file.

Ensure that the provided Git identity has the necessary permissions to push changes to the specified repository and branch.
DESCRIPTION
}
