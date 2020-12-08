# Download the latest Ghost Image
resource "docker_image" "image_id" {
  name = "${var.image_name}"
}

# Start the Container
resource "docker_container" "container_id" {
  name  = "${var.container_name}"
  image = "${docker_image.image_id.latest}"
  capabilities {
    add  = ["ALL"]
    drop = ["SYS_ADMIN"]
  }
  ports {
    internal = "${var.int_port}"
    external = "${var.ext_port}"
  }
  mounts {
    target = "${var.target_vol}"
    source = "${var.source_vol}"
    type   = "${var.mount_type}"
  }
}
