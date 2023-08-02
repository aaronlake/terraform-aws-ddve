variable "ddve_name_tag" {
  description = "Provide a name tag for the EC2 instance and EBS volumes that are created."
  type        = string
}

variable "ddve_model" {
  description = "m6i instance type is recommended for DDVE initial deployment. In case m6i is unavailable at current region, you can deploy with m5 instance type option."
  type        = string
  default     = "16TBModelm6i.xlarge"
}

variable "ddve_metadata_disk_number" {
  description = "Recommended metadata disk storage is 10% of the total capacity. The default number of metadata disks attached for each model : 16 TB Model - 2 * 1 TiB disks, 32 TB Model - 4 * 1 TiB disks, 96 TB Model - 10 * 1 TiB disks, 256 TB Model - 13 * 2 TiB disks. Override the default number of metadata disks below:"
  type        = string
  default     = "Default"
}

variable "ddve_option4_create_s3_bucket" {
  description = "User can choose Yes to create S3 bucket from this Cloud Formation or No to create S3 bucket at another occasion."
  type        = bool
  default     = false
}

variable "ddve_s3_bucket_name" {
  description = "S3 Bucket Name. Note: 1. this field is valid only when you choose Yes in above S3 Bucket Creation Option parameter. 2. please follow AWS S3 Bucket naming rules - https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html,  do not include dot(.) in bucket name as we recommend to use hosted-style URL to access S3. 3. make sure the access to this S3 bucket is granted in the IAM role."
  type        = string
}

variable "ddve_iam_role" {
  description = "The IAM Role that grants S3 access to the DDVE instance. If it is not already created, you can click this URL: https://console.aws.amazon.com/iam/home#/roles to create the IAM role. Alternatively, you can leave this field blank to create and attach the IAM role later to the DDVE instance."
  type        = string
}

variable "ddve_subnet_id" {
  description = "DDVE Subnet ID in your Virtual Private Cloud (VPC)"
  type        = string
}

variable "ddve_security_group_ids" {
  description = "Security groups that can be used to control access to the DDVE instances"
  type        = set(string)
}

variable "ddve_key_pair_name" {
  description = "Key Pair that can be used to access the DDVE instance"
  type        = string
}

variable "ddve_private_ip_option" {
  description = "Auto-Assign Private IP or Custom Private IP"
  type        = string
  default     = "Auto-Assign Private IP"
}

variable "ddve_custom_private_ip_address" {
  description = "Assign custom private IP address to DDVE primary network interface. Note: this field is used only if you choose the Custom Private IP option in above Private IP Address Option parameter. Please make sure the IP address is, 1. a valid IPv4 address; 2. in the CIDR range of the selected subnet; 3. available in the selected subnet, otherwise the stack creation would fail."
  type        = string
  default     = "0.0.0.0"
}
