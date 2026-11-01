# --- Service accounts (оставлены, не мешают) ---
resource "yandex_iam_service_account" "k8s_sa" {
  name = "k8s-cluster-sa"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s_sa_editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.k8s_sa.id}"
}

# --- Data source для образа Ubuntu 22.04 ---
data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

# --- Master node (1 шт., не прерываемая) ---
resource "yandex_compute_instance" "master" {
  name        = "k8s-master"
  platform_id = "standard-v3"
  zone        = var.default_zone

  resources {
    cores         = 2
    memory        = 4
    core_fraction = 50
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      type     = "network-hdd"
      size     = 30
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.a.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_public_key_path)}"
  }

  scheduling_policy {
    preemptible = false
  }
}

# --- Worker nodes (2 шт., прерываемые) ---
resource "yandex_compute_instance" "worker" {
  count       = var.worker_count
  name        = "k8s-worker-${count.index + 1}"
  platform_id = "standard-v3"
  zone        = var.default_zone

  resources {
    cores         = 2
    memory        = 4
    core_fraction = 50
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      type     = "network-hdd"
      size     = 30
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.a.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/netology-ya-cloud.pub")}"
  }

  scheduling_policy {
    preemptible = true
  }
}