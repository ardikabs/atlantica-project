variable "atlantis_user" {
  description = "The VCS username of who is running the plan command. This will be used to name the session when assuming a role. More information - https://www.runatlantis.io/docs/provider-credentials.html#aws"
  default     = "atlantis_user"
}

variable "atlantis_repo_owner" {
  description = "The name of the owner of the repo the pull request is in. This will be used to name the session when assuming a role. More information - https://www.runatlantis.io/docs/provider-credentials.html#aws"
  default     = ""
}

variable "atlantis_repo_name" {
  description = "The name of the repo the pull request is in. This will be used to name the session when assuming a role. More information - https://www.runatlantis.io/docs/provider-credentials.html#aws"
  default     = ""
}

variable "atlantis_pull_num" {
  description = "The pull request number. This will be used to name the session when assuming a role. More information - https://www.runatlantis.io/docs/provider-credentials.html#aws"
  default     = ""
}