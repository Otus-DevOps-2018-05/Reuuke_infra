resource "google_compute_http_health_check" "reddit-health-check" {
  name = "reddit-health-check"
  port = "9292"
}

resource "google_compute_target_pool" "reddit-pool" {
  name = "reddit-pool"

  instances = [
    "${google_compute_instance.reddit-app.*.self_link}",
  ]

  health_checks = ["${google_compute_http_health_check.reddit-health-check.self_link}"]
}

resource "google_compute_forwarding_rule" "reddit-lb" {
  name       = "reddit-forwarding-rule"
  target     = "${google_compute_target_pool.reddit-pool.self_link}"
  port_range = "9292"
}
