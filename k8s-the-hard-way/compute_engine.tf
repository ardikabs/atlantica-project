resource "random_shuffle" "az" {
  input = ["asia-southeast1-a","asia-southeast1-b","asia-southeast1-c"]
  result_count = 1
}

resource "google_compute_instance" "master" {
  count = var.kubernetes.master.count

  name = "${var.prefix_name}-master-${count.index}"
  machine_type = var.kubernetes.master.machine_type
  zone = element(random_shuffle.az.result, 0)
  can_ip_forward = true

  tags = [
    "kubernetes",
    "master"
  ]

  network_interface {
    network = "common"
    subnetwork = "kubernetes"
    network_ip = "10.252.100.${10 + count.index}"
  }

  boot_disk {
    initialize_params {
      size = 100
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  service_account {
    scopes = [
      "compute-rw",
      "storage-ro",
      "service-management",
      "service-control",
      "logging-write",
      "monitoring"
    ]
  }
}


resource "google_compute_instance" "worker" {
  count = var.kubernetes.worker.count

  name = "${var.prefix_name}-worker-${count.index}"
  machine_type = var.kubernetes.worker.machine_type
  zone = element(random_shuffle.az.result, 0)
  can_ip_forward = true

  tags = [
    "kubernetes",
    "master"
  ]

  network_interface {
    network = "common"
    subnetwork = "kubernetes"
    network_ip = "10.252.100.${100 + count.index}"
  }

  boot_disk {
    initialize_params {
      size = 100
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  service_account {
    scopes = [
      "compute-rw",
      "storage-ro",
      "service-management",
      "service-control",
      "logging-write",
      "monitoring"
    ]
  }
}
