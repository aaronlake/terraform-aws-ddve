Terraform module to create a Dell EMC Data Domain Virtual Edition (DD VE)
instance in AWS. This module is 100% untested at this point, assume it will
cause your AWS account to be deleted and your house to burn down.

This module is based on the CloudFormation template provided by Dell EMC
here: https://aws.amazon.com/marketplace/pp/prodview-32kgz2d4acdns

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.10.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ddve_iam_role"></a> [ddve\_iam\_role](#input\_ddve\_iam\_role) | The IAM Role that grants S3 access to the DDVE instance. If it is not already created, you can click this URL: https://console.aws.amazon.com/iam/home#/roles to create the IAM role. Alternatively, you can leave this field blank to create and attach the IAM role later to the DDVE instance. | `string` | n/a | yes |
| <a name="input_ddve_key_pair_name"></a> [ddve\_key\_pair\_name](#input\_ddve\_key\_pair\_name) | Key Pair that can be used to access the DDVE instance | `string` | n/a | yes |
| <a name="input_ddve_name_tag"></a> [ddve\_name\_tag](#input\_ddve\_name\_tag) | Provide a name tag for the EC2 instance and EBS volumes that are created. | `string` | n/a | yes |
| <a name="input_ddve_s3_bucket_name"></a> [ddve\_s3\_bucket\_name](#input\_ddve\_s3\_bucket\_name) | S3 Bucket Name. Note: 1. this field is valid only when you choose Yes in above S3 Bucket Creation Option parameter. 2. please follow AWS S3 Bucket naming rules - https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html,  do not include dot(.) in bucket name as we recommend to use hosted-style URL to access S3. 3. make sure the access to this S3 bucket is granted in the IAM role. | `string` | n/a | yes |
| <a name="input_ddve_security_group_ids"></a> [ddve\_security\_group\_ids](#input\_ddve\_security\_group\_ids) | Security groups that can be used to control access to the DDVE instances | `set(string)` | n/a | yes |
| <a name="input_ddve_subnet_id"></a> [ddve\_subnet\_id](#input\_ddve\_subnet\_id) | DDVE Subnet ID in your Virtual Private Cloud (VPC) | `string` | n/a | yes |
| <a name="input_ddve_custom_private_ip_address"></a> [ddve\_custom\_private\_ip\_address](#input\_ddve\_custom\_private\_ip\_address) | Assign custom private IP address to DDVE primary network interface. Note: this field is used only if you choose the Custom Private IP option in above Private IP Address Option parameter. Please make sure the IP address is, 1. a valid IPv4 address; 2. in the CIDR range of the selected subnet; 3. available in the selected subnet, otherwise the stack creation would fail. | `string` | `"0.0.0.0"` | no |
| <a name="input_ddve_metadata_disk_number"></a> [ddve\_metadata\_disk\_number](#input\_ddve\_metadata\_disk\_number) | Recommended metadata disk storage is 10% of the total capacity. The default number of metadata disks attached for each model : 16 TB Model - 2 * 1 TiB disks, 32 TB Model - 4 * 1 TiB disks, 96 TB Model - 10 * 1 TiB disks, 256 TB Model - 13 * 2 TiB disks. Override the default number of metadata disks below: | `string` | `"Default"` | no |
| <a name="input_ddve_model"></a> [ddve\_model](#input\_ddve\_model) | m6i instance type is recommended for DDVE initial deployment. In case m6i is unavailable at current region, you can deploy with m5 instance type option. | `string` | `"16TBModelm6i.xlarge"` | no |
| <a name="input_ddve_option4_create_s3_bucket"></a> [ddve\_option4\_create\_s3\_bucket](#input\_ddve\_option4\_create\_s3\_bucket) | User can choose Yes to create S3 bucket from this Cloud Formation or No to create S3 bucket at another occasion. | `bool` | `false` | no |
| <a name="input_ddve_private_ip_option"></a> [ddve\_private\_ip\_option](#input\_ddve\_private\_ip\_option) | Auto-Assign Private IP or Custom Private IP | `string` | `"Auto-Assign Private IP"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | InstanceId of the newly created EC2 instance |
| <a name="output_password"></a> [password](#output\_password) | The password to use SSH or DDSM(GUI) to connect to DDVE |
| <a name="output_private_dns_name"></a> [private\_dns\_name](#output\_private\_dns\_name) | The prviate DNS Name of DDVE |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | The prviate IP of DDVE |
| <a name="output_s3_bucket"></a> [s3\_bucket](#output\_s3\_bucket) | The name of S3 Bucket |
| <a name="output_username"></a> [username](#output\_username) | The user name to use SSH or DDSM(GUI) to connect to DDVE |
