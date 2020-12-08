#Define variables
variable "container_name" {
  description = "Name of the container."
  default     = "nginx_con"
}
variable "image_name" {
  description = "Image for container."
  default     = "nginx:latest"
}
variable "int_port" {
  description = "Internal port for container."
  default     = "80"
}
variable "ext_port" {
  description = "External port for container."
  default     = "8081"
}
variable "target_vol" {
  description = "For the container path"
  default     = "/usr/share/nginx/html"
}
variable "source_vol" {
  description = "For the mount"
  default     = "/tmp/html"
}
variable "mount_type" {
  description = "Mount Type"
  default     = "bind"
}


