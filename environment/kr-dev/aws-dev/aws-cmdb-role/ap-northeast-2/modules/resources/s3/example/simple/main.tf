module "s3" {
  source              = "../.."
  bucket_name         = "koupang-centralized-vpc-flow-logs"
  force_destroy       = false
  object_lock_enabled = false
  bucket_prefix       = null
}

