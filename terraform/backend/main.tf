provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
  service_account_key_file = var.sa_key_file
}

resource "yandex_iam_service_account" "tf" {
  name = "tf-admin"
}

resource "yandex_resourcemanager_folder_iam_member" "tf_editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.tf.id}"
}

resource "yandex_iam_service_account_static_access_key" "tf" {
  service_account_id = yandex_iam_service_account.tf.id
  description        = "tf state backend"
}

resource "yandex_storage_bucket" "tf_state" {
  bucket     = var.bucket_name
  access_key = yandex_iam_service_account_static_access_key.tf.access_key
  secret_key = yandex_iam_service_account_static_access_key.tf.secret_key
}