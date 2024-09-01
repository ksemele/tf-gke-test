# Optionallly you can use bucket as backend
# If you would to do that - uncomment code below and follow instructions in README.md

terraform {
  backend "gcs" {
    bucket      = var.bucket_name
    prefix      = var.bucket_prefix
    credentials = var.bucket_credentials_json
  }
}
