output "https_trigger_url" {
  value = module.dragondrop-compute.https_trigger_url
}

output "migration_history_bucket_name" {
    value = aws_s3_bucket.migration_history.bucket
}
