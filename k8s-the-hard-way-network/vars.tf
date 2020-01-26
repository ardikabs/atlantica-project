variable project {
  description = "Project Information"
  type = object({
    name = string
    credential = string
    region = string
  })
  default = {
    name = "production-257013"
    credential = "accounts.json"
    region = "asia-southeast1"
  }
}
