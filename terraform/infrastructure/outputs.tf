output "vpc_id" {
  value = yandex_vpc_network.main.id
}

output "subnet_a_id" {
  value = yandex_vpc_subnet.a.id
}

output "master_public_ip" {
  value = yandex_compute_instance.master.network_interface[0].nat_ip_address
}

output "master_private_ip" {
  value = yandex_compute_instance.master.network_interface[0].ip_address
}

output "worker_public_ips" {
  value = yandex_compute_instance.worker[*].network_interface[0].nat_ip_address
}

output "worker_private_ips" {
  value = yandex_compute_instance.worker[*].network_interface[0].ip_address
}

output "registry_id" {
  value = yandex_container_registry.app.id
}

output "registry_url" {
  value = "cr.yandex/${yandex_container_registry.app.id}"
}