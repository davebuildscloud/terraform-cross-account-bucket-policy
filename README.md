# Terraform S3 bucket policy to grant read-only access to another AWS account

## Overview
This project deploys an S3 bucket policy to grant another account read-only access to the S3 bucket.

Note that the account accessing the S3 bucket being accessed must apply IAM policies to an IAM role assigned to a file share.

Deploying this project in an AWS account can launch resources that are not free to deploy and use.  Consult the various AWS pricing guides available for the resources included in this project before deploying these resources.

## Disclaimer
The author of this terraform example bears no responsibility for any costs that may arise as a result of using this project.  User of this example code assumes full responsibility for it's use and any results that may come from its deployment.
  
## Usage Instructions
The code in this repo is meant to be incorporated into a separate project deploying one or more storage gateways across multiple accounts.

This code can also be consumed as a terraform module.  To use this project as a module, you can call it by doing the following: 
 ```hcl-terraform
module "bucket_policy" {
  source                = "${path_to_this_module}"
  bucket_name           = "" #the bucket to whcih the policy is being added
  bucket_arn            = "" #the ARN of the bucket to which the policy is being applied
  read_account_id       = "" #the 12 digit account number to which you are granting access
}
```

