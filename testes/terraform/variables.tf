variable "content_types" {
  type = map(string)

  default = {
    ".html" = "text/html; charset=utf-8",
    ".css"  = "text/css; charset=utf-8",
    ".js"   = "text/javascript; charset=utf-8",
    ".png"  = "image/png",
    ".jpeg" = "image/jpeg",
    ".jfif" = "image/jpeg",
    ".jpg"  = "image/jpeg",
    ".svg"  = "image/svg+xml",
    ".webp" = "image/webp",
    ".avif" = "image/avif",
  }
}

variable "db_password" {
  default   = "tutorial_rds12345"
  sensitive = true
}

variable "db_username" {
  default   = "tutorial_rds"
  sensitive = true
}
