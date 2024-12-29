run "arrange" {
  module {
    source = "./tests/setup"
  }
}

run "act" {
  module {
    source = "./"
  }

  variables {
    repository = run.arrange.repository_name
    branch     = "main"
    commit_user = {
      name  = var.github_username
      email = var.github_email
    }
  }

}

run "assert" {
  module {
    source = "./tests/final"
  }

  variables {
    endpoint = "https://www.github.com/${run.arrange.username}/${run.arrange.repository_name}/blob/main/.github/workflows/azure-login-test.yaml"
  }

  assert {
    condition     = data.http.readme.status_code == 200
    error_message = "GitHub with HTTP status ${data.http.readme.status_code}"
  }
}