variable "config_path" {
  
}

locals {
  path         = var.config_path
  config_files = fileset(local.path, "*.json")

  config = { for k, v in local.config_files :
    split(".", k)[0] => jsondecode(file("${local.path}/${k}"))
  }

}

output "files" {
    value = local.config
}