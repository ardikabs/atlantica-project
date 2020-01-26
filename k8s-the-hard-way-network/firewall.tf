resource "google_compute_firewall" "external" {
  name    = "allow-common-external"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports = [
      "22",
      "443",
      "6443"
    ]
  }

  source_ranges = ["0.0.0.0/0"]
  source_tags = ["external"]
}

resource "google_compute_firewall" "internal" {
  name    = "allow-common-internal"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = [
    "10.252.0.0/16",
    "10.200.0.0/16"
  ]
  source_tags = ["internal"]
}

resource "google_compute_firewall" "google-health-check" {
  name    = "allow-common-health-check"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports = [
      "80",
      "443"
    ]
  }

  source_ranges = [
    "35.191.0.0/16",
    "130.211.0.0/22",
    "209.85.152.0/22",
    "209.85.204.0/22"
  ]
  source_tags = ["google-health-check"]
}
