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

variable prefix_name {
  description = "Compute Engine prefix name"
  type = string
  default = ""
}

variable kubernetes {
  description = "Number of kubernetes master machine"
  type = object({
    master = object({
      count = number
      machine_type = string
    })
    worker = object({
      count = number
      machine_type = string
    })
  })

  default = {
    master = {
      count = 3
      machine_type = "n1-standard-2"
    }
    worker = {
      count = 3
      machine_type = "n1-standard-2"
    }
  }
}

