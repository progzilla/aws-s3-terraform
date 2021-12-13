variable "aws_profile" {
  type = string
  description = "AWS Credential Profile"
}

variable "aws_region" {
  type = string
  description = "location of infrastructure"
}

# variable "state_file" {
#   type = string
#   description = "Path to terraform state file"
# }

variable "AWS_ACCESS_KEY_ID" {
  type = string
  description = "AWS Access Key ID credential"
}

variable "AWS_SECRET_KEY_ID" {
  type = string
  description = "AWS Secret Key ID credential"
}