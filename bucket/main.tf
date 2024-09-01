module "bucket" {
  # https://registry.terraform.io/modules/terraform-google-modules/cloud-storage/google/6.0.1/submodules/simple_bucket?tab=inputs
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "~> 6.0"

  name       = "${var.project}-bucket"
  project_id = var.project
  location   = "eu"

  force_destroy = true # Use this only for testing purposes

  iam_members = [{
    role   = "roles/storage.objectAdmin"
    member = "user:${var.iam_user_email}"
  }]

  autoclass = true
}
