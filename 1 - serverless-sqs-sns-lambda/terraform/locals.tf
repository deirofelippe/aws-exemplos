locals {
  namespaced_service_name = "${var.service_name}-${var.env}"

  lambdas_path = "${path.module}/../lambdas"
  layers_path  = "${path.module}/../layers"

  common_tags = {
    project    = "Lambda Layers with Terraform"
    created_at = formatdate("YYYY-MM-DD", timestamp())
    managed_by = "Terraform"
    owner      = "Felippe Deiró"
  }

  lambdas = {
    get = {
      description = "Get catalogs"
      memory      = 256
      timeout     = 18
    }
    post = {
      description = "Post category"
      memory      = 128
      timeout     = 5
    }
    patch = {
      description = "Patch category"
      memory      = 128
      timeout     = 5
    }
    delete = {
      description = "Delete category"
      memory      = 128
      timeout     = 5
    }
  }
}