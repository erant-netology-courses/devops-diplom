variable "cloud_id" {
  type    = string
  default = "b1ghf04gk3pjrsrgql70"
}

variable "folder_id" {
  type    = string
  default = "b1gtv0ajanmlin9k1k48"
}

variable "default_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "vpc_name" {
  type    = string
  default = "diplom-vpc"
}

variable "subnet_cidr_a" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet_cidr_d" {
  type    = string
  default = "10.0.3.0/24"
}

variable "subnet_cidr_e" {
  type    = string
  default = "10.0.4.0/24"
}

variable "worker_count" {
  type    = number
  default = 2
}

variable "sa_key_file" {
  type        = string
  description = "Path to service account key"
  default     = "../authkey.json"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for VM access"
  default     = ""
}