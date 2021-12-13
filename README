# Use Terraform to upload mp3 files to AWS s3

1. terraform init
2. terraform plan \
 -var "AWS_ACCESS_KEY_ID=xxxxx" \
 -var "AWS_SECRET_KEY_ID=xxxxx"
3. terraform apply \
 -var "AWS_ACCESS_KEY_ID=xxxxx" \
 -var "AWS_SECRET_KEY_ID=xxxxx"

*where xxxx are our AWS IAM credentials

Ensure you grant IAM policy to enable backend deploy tfstate file. <br>See [s3 Backend config](https://www.terraform.io/docs/language/settings/backends/s3.html)