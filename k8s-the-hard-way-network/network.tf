resource "google_compute_network" "vpc" {
  name = "common"
  auto_create_subnetworks = false
  routing_mode = "GLOBAL"
  delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "kubernetes" {
  name = "kubernetes"
  ip_cidr_range = "10.252.100.0/24"
  region = "asia-southeast1"
  network = google_compute_network.vpc.self_link
}
