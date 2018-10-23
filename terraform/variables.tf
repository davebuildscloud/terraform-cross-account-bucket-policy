variable "bucket_arn" {
  description = "The arn of the bucket to which access is being granted"
}

variable "read_account_id" {
  description = "The ID of the account that is being granted read-only access to this bucket"
}

variable "bucket_name" {
  description = "The name of the bucket to which the policy is applied"
}
