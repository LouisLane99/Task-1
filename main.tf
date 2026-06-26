resource "google_storage_bucket" "private_bucket" {

    name = var.bucket_name
    location = var.region

    storage_class = "STANDARD"

    uniform_bucket_level_access = true

    versioning {
        enabled = true
    }

    public_access_prevention = "enforced"
}