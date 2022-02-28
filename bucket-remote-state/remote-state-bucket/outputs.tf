output "bucket-name"{
    value = aws_s3_bucket.remote-state.bucket_domain_name
}

output "dynamo-name"{
    value = aws_dynamodb_table.lock-table.name
}