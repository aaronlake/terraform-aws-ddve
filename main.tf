/*
 * Terraform module to create a Dell EMC Data Domain Virtual Edition (DD VE)
 * instance in AWS. This module is 100% untested at this point, assume it will
 * cause your AWS account to be deleted and your house to burn down.
*/

data "aws_region" "current" {}

resource "aws_instance" "ddve_ec2_instance" {
  instance_type          = local.mappings["DdveConfigPerModel"][var.ddve_model]["InstanceType"]
  subnet_id              = var.ddve_subnet_id
  vpc_security_group_ids = var.ddve_security_group_ids
  private_ip             = local.is_custom_private_ip_used ? var.ddve_custom_private_ip_address : null
  iam_instance_profile   = local.is_role_applied ? var.ddve_iam_role : null
  key_name               = var.ddve_key_pair_name
  ami                    = local.mappings.DdveConfigPerRegion[data.aws_region.current.name].AmiId

  ebs_block_device {
    delete_on_termination = true
    device_name           = "/dev/sda1"
    volume_type           = local.mappings["DdveConfigPerModel"][var.ddve_model]["RootDiskType"]
    volume_size           = local.mappings["DdveConfigPerModel"][var.ddve_model]["RootDiskSize"]
  }

  tags = {
    Name = var.ddve_name_tag
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  count  = local.is_s3_bucket_to_be_created ? 1 : 0
  bucket = var.ddve_s3_bucket_name
}

resource "aws_s3_bucket_acl" "s3_bucket" {
  count  = local.is_s3_bucket_to_be_created ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket[0].id
  acl    = "private"
}

resource "aws_ebs_volume" "nvram" {
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["NvramDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["NvramDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_NVRAM"])
  }
}

resource "aws_ebs_volume" "metadata_disk1" {
  count             = local.is_metadata_disk_1_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_1"])
  }
}

resource "aws_ebs_volume" "metadata_disk2" {
  count             = local.is_metadata_disk_2_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_2"])
  }
}

resource "aws_ebs_volume" "metadata_disk3" {
  count             = local.is_metadata_disk_3_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_3"])
  }
}

resource "aws_ebs_volume" "metadata_disk4" {
  count             = local.is_metadata_disk_4_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_4"])
  }
}

resource "aws_ebs_volume" "metadata_disk5" {
  count             = local.is_metadata_disk_5_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_5"])
  }
}

resource "aws_ebs_volume" "metadata_disk6" {
  count             = local.is_metadata_disk_6_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_6"])
  }
}

resource "aws_ebs_volume" "metadata_disk7" {
  count             = local.is_metadata_disk_7_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_7"])
  }
}

resource "aws_ebs_volume" "metadata_disk8" {
  count             = local.is_metadata_disk_8_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_8"])
  }
}

resource "aws_ebs_volume" "metadata_disk9" {
  count             = local.is_metadata_disk_9_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_9"])
  }
}

resource "aws_ebs_volume" "metadata_disk10" {
  count             = local.is_metadata_disk_10_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_10"])
  }
}

resource "aws_ebs_volume" "metadata_disk11" {
  count             = local.is_metadata_disk_11_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_11"])
  }
}

resource "aws_ebs_volume" "metadata_disk12" {
  count             = local.is_metadata_disk_12_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_12"])
  }
}

resource "aws_ebs_volume" "metadata_disk13" {
  count             = local.is_metadata_disk_13_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_13"])
  }
}

resource "aws_ebs_volume" "metadata_disk14" {
  count             = local.is_metadata_disk_14_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_14"])
  }
}

resource "aws_ebs_volume" "metadata_disk15" {
  count             = local.is_metadata_disk_15_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_15"])
  }
}

resource "aws_ebs_volume" "metadata_disk16" {
  count             = local.is_metadata_disk_16_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_16"])
  }
}

resource "aws_ebs_volume" "metadata_disk17" {
  count             = local.is_metadata_disk_17_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_17"])
  }
}

resource "aws_ebs_volume" "metadata_disk18" {
  count             = local.is_metadata_disk_18_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_18"])
  }
}

resource "aws_ebs_volume" "metadata_disk19" {
  count             = local.is_metadata_disk_19_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_19"])
  }
}

resource "aws_ebs_volume" "metadata_disk20" {
  count             = local.is_metadata_disk_20_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_20"])
  }
}

resource "aws_ebs_volume" "metadata_disk21" {
  count             = local.is_metadata_disk_21_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_21"])
  }
}

resource "aws_ebs_volume" "metadata_disk22" {
  count             = local.is_metadata_disk_22_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_22"])
  }
}

resource "aws_ebs_volume" "metadata_disk23" {
  count             = local.is_metadata_disk_23_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_23"])
  }
}

resource "aws_ebs_volume" "metadata_disk24" {
  count             = local.is_metadata_disk_24_valid ? 1 : 0
  size              = local.mappings["DdveConfigPerModel"][var.ddve_model]["PerMetadataDiskSize"]
  type              = local.mappings["DdveConfigPerModel"][var.ddve_model]["MetadataDiskType"]
  availability_zone = aws_instance.ddve_ec2_instance.availability_zone
  tags = {
    Name = join("", [var.ddve_name_tag, "_MetadataDisk_24"])
  }
}

resource "aws_volume_attachment" "mount_point4_nvram" {
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.nvram.id
  device_name = "/dev/sdb"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk1" {
  count       = local.is_metadata_disk_1_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk1[0].id
  device_name = "/dev/sdc"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk2" {
  count       = local.is_metadata_disk_2_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk2[0].id
  device_name = "/dev/sdd"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk3" {
  count       = local.is_metadata_disk_3_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk3[0].id
  device_name = "/dev/sde"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk4" {
  count       = local.is_metadata_disk_4_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk4[0].id
  device_name = "/dev/sdf"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk5" {
  count       = local.is_metadata_disk_5_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk5[0].id
  device_name = "/dev/sdg"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk6" {
  count       = local.is_metadata_disk_6_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk6[0].id
  device_name = "/dev/sdh"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk7" {
  count       = local.is_metadata_disk_7_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk7[0].id
  device_name = "/dev/sdi"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk8" {
  count       = local.is_metadata_disk_8_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk8[0].id
  device_name = "/dev/sdj"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk9" {
  count       = local.is_metadata_disk_9_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk9[0].id
  device_name = "/dev/sdk"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk10" {
  count       = local.is_metadata_disk_10_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk10[0].id
  device_name = "/dev/sdl"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk11" {
  count       = local.is_metadata_disk_11_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk11[0].id
  device_name = "/dev/sdm"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk12" {
  count       = local.is_metadata_disk_12_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk12[0].id
  device_name = "/dev/sdn"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk13" {
  count       = local.is_metadata_disk_13_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk13[0].id
  device_name = "/dev/sdo"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk14" {
  count       = local.is_metadata_disk_14_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk14[0].id
  device_name = "/dev/sdp"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk15" {
  count       = local.is_metadata_disk_15_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk15[0].id
  device_name = "/dev/sdq"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk16" {
  count       = local.is_metadata_disk_16_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk16[0].id
  device_name = "/dev/sdr"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk17" {
  count       = local.is_metadata_disk_17_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk17[0].id
  device_name = "/dev/sds"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk18" {
  count       = local.is_metadata_disk_18_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk18[0].id
  device_name = "/dev/sdt"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk19" {
  count       = local.is_metadata_disk_19_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk19[0].id
  device_name = "/dev/sdu"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk20" {
  count       = local.is_metadata_disk_20_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk20[0].id
  device_name = "/dev/sdv"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk21" {
  count       = local.is_metadata_disk_21_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk21[0].id
  device_name = "/dev/sdw"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk22" {
  count       = local.is_metadata_disk_22_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk22[0].id
  device_name = "/dev/sdx"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk23" {
  count       = local.is_metadata_disk_23_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk23[0].id
  device_name = "/dev/sdy"
}

resource "aws_volume_attachment" "mount_point4_metadata_disk24" {
  count       = local.is_metadata_disk_24_valid ? 1 : 0
  instance_id = aws_instance.ddve_ec2_instance.arn
  volume_id   = aws_ebs_volume.metadata_disk24[0].id
  device_name = "/dev/sdz"
}
