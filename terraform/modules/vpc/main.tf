resource "google_compute_firewall" "firewall_ssh" {
  name    = "${var.environment_name}-allow-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = "${var.source_ranges}"
}

resource "google_compute_firewall" "firewall_http" {
  name    = "${var.environment_name}-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = "${var.source_ranges}"
}
