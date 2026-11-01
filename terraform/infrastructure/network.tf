resource "yandex_vpc_network" "main" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "a" {
  name           = "${var.vpc_name}-a"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = [var.subnet_cidr_a]
}

resource "yandex_vpc_subnet" "d" {
  name           = "${var.vpc_name}-d"
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = [var.subnet_cidr_d]
}

resource "yandex_vpc_subnet" "e" {
  name           = "${var.vpc_name}-e"
  zone           = "ru-central1-e"
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = [var.subnet_cidr_e]
}