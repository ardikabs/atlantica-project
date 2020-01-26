
terraform {
  backend "gcs" {
    credentials = "/etc/accounts.json"
    bucket = "atlantis-tf"
    prefix = "atlantica-project"
  }
}
