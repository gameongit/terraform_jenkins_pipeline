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
  default     = "2368"
}
variable "ext_port" {
  description = "External port for container."
  default     = "80"
}
