resource "google_compute_instance" "db" {
  name         = "${var.environment_name}-reddit-db"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["${var.environment_name}-reddit-db"]

  boot_disk {
    initialize_params {
      image = "${var.db_disk_image}"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
}

resource "google_compute_firewall" "firewall_mongo" {
  name    = "${var.environment_name}-mongo-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  target_tags = ["${var.environment_name}-reddit-db"]
  source_tags = ["${var.environment_name}-reddit-app"]
}
