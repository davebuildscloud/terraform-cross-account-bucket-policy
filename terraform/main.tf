resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = "${var.bucket_name}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "${var.bucket_name}-${var.read_account_id}-read",
  "Statement": [
    {
            "Sid": "${var.bucket_name}-${var.read_account_id}-bucket-read",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.read_account_id}:root"
            },
            "Action": [
                "s3:GetBucketLocation",
                "s3:GetBucketVersioning",
                "s3:GetAccelerateConfiguration",
                "s3:ListBucket",
                "s3:ListBucketVersions",
                "s3:ListBucketMultipartUploads"
            ],
            "Resource": "${var.bucket_arn}"
        },
        {
            "Sid": "${var.bucket_name}-${var.read_account_id}-object-read",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.read_account_id}:root"
            },
            "Action": [
                "s3:GetObject",
                "s3:GetObjectACL",
                "s3:GetObjectTagging",
                "s3:GetObjectVersion",
                "s3:GetObjectVersionAcl",
                "s3:GetObjectVersionTagging",
                "s3:ListMultipartUploadParts"
            ],
            "Resource": "${var.bucket_arn}/*"
        }
  ]
}
POLICY
}
