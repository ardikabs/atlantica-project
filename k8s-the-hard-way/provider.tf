provider "google" {
  credentials = file(var.project.credential)
  project = var.project.name
  region = var.project.region
}
