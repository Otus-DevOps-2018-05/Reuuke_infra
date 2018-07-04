output "app_external_ip" {
  value = "${google_compute_instance.reddit-app.*.network_interface.0.access_config.0.assigned_nat_ip}"
}

output "forwarding_rule_ip" {
  value = "${google_compute_forwarding_rule.reddit-lb.ip_address}"
}
