variable "cloud_id" {
  type        = string
  default     = "b1ghf04gk3pjrsrgql70"
}

variable "folder_id" {
  type        = string
  default     = "b1gtv0ajanmlin9k1k48"
}

variable "zone" {
  type    = string
  default = "ru-central1-a"
}

variable "bucket_name" {
  type    = string
  default = "diplom-tfstate-erant-2026"
}

variable "sa_key_file" {
  type        = string
  description = "Path to service account key"
  default     = "../authkey.json"
}