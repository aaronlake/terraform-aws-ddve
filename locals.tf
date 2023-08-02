locals {
  is_role_applied                                       = !var.ddve_iam_role == ""
  is_s3_bucket_to_be_created                            = var.ddve_option4_create_s3_bucket
  is_s3_bucket_name_vacant                              = var.ddve_s3_bucket_name == ""
  is_custom_private_ip_used                             = var.ddve_private_ip_option == "Custom Private IP"
  is_default_metadata_disk_num_used                     = var.ddve_metadata_disk_number == "Default"
  is_this_metadata_disk_valid_4_metadata_disk_num_15_24 = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "15", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "16", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "17", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "18", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "19", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "20", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "21", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "22", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "23", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "24"])
  is_this_metadata_disk_valid_4_metadata_disk_num_8_24  = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "8", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "9", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "10", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "11", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "12", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "13", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "14", local.is_this_metadata_disk_valid_4_metadata_disk_num_15_24])
  is_metadata_disk_1_valid                              = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "1", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "2", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "3", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "4", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "5", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "6", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "7", local.is_this_metadata_disk_valid_4_metadata_disk_num_8_24])
  is_metadata_disk_2_valid                              = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "2", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "3", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "4", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "5", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "6", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "7", local.is_this_metadata_disk_valid_4_metadata_disk_num_8_24])
  is_metadata_disk_3_valid                              = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "3", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "4", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "5", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "6", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "7", local.is_this_metadata_disk_valid_4_metadata_disk_num_8_24])
  is_metadata_disk_4_valid                              = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "4", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "5", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "6", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "7", local.is_this_metadata_disk_valid_4_metadata_disk_num_8_24])
  is_metadata_disk_5_valid                              = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "5", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "6", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "7", local.is_this_metadata_disk_valid_4_metadata_disk_num_8_24])
  is_metadata_disk_6_valid                              = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "6", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "7", local.is_this_metadata_disk_valid_4_metadata_disk_num_8_24])
  is_metadata_disk_7_valid                              = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "7", local.is_this_metadata_disk_valid_4_metadata_disk_num_8_24])
  is_metadata_disk_8_valid                              = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "8", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "9", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "10", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "11", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "12", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "13", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "14", local.is_this_metadata_disk_valid_4_metadata_disk_num_15_24])
  is_metadata_disk_9_valid                              = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "9", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "10", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "11", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "12", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "13", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "14", local.is_this_metadata_disk_valid_4_metadata_disk_num_15_24])
  is_metadata_disk_10_valid                             = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "10", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "11", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "12", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "13", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "14", local.is_this_metadata_disk_valid_4_metadata_disk_num_15_24])
  is_metadata_disk_11_valid                             = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "11", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "12", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "13", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "14", local.is_this_metadata_disk_valid_4_metadata_disk_num_15_24])
  is_metadata_disk_12_valid                             = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "12", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "13", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "14", local.is_this_metadata_disk_valid_4_metadata_disk_num_15_24])
  is_metadata_disk_13_valid                             = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "13", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "14", local.is_this_metadata_disk_valid_4_metadata_disk_num_15_24])
  is_metadata_disk_14_valid                             = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "14", local.is_this_metadata_disk_valid_4_metadata_disk_num_15_24])
  is_metadata_disk_15_valid                             = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "15", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "16", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "17", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "18", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "19", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "20", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "21", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "22", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "23", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "24"])
  is_metadata_disk_16_valid                             = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "16", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "17", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "18", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "19", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "20", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "21", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "22", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "23", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "24"])
  is_metadata_disk_17_valid                             = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "17", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "18", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "19", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "20", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "21", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "22", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "23", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "24"])
  is_metadata_disk_18_valid                             = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "18", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "19", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "20", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "21", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "22", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "23", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "24"])
  is_metadata_disk_19_valid                             = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "19", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "20", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "21", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "22", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "23", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "24"])
  is_metadata_disk_20_valid                             = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "20", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "21", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "22", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "23", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "24"])
  is_metadata_disk_21_valid                             = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "21", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "22", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "23", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "24"])
  is_metadata_disk_22_valid                             = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "22", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "23", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "24"])
  is_metadata_disk_23_valid                             = anytrue([local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "23", local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "24"])
  is_metadata_disk_24_valid                             = local.mappings["DdveMetadataDiskNumPerUserSelect"][var.ddve_model][var.ddve_metadata_disk_number] == "24"
  mappings = {
    DdveConfigPerModel = {
      "16TBModelm6i.xlarge" = {
        InstanceType           = "m6i.xlarge"
        RootDiskType           = "gp3"
        RootDiskSize           = "250"
        NvramDiskType          = "gp3"
        NvramDiskSize          = "10"
        MetadataDiskType       = "gp3"
        PerMetadataDiskSize    = "1024"
        MetadataDiskDefaultNum = "2"
      }
      "32TBModelm6i.2xlarge" = {
        InstanceType           = "m6i.2xlarge"
        RootDiskType           = "gp3"
        RootDiskSize           = "250"
        NvramDiskType          = "gp3"
        NvramDiskSize          = "10"
        MetadataDiskType       = "gp3"
        PerMetadataDiskSize    = "1024"
        MetadataDiskDefaultNum = "4"
      }
      "96TBModelm6i.4xlarge" = {
        InstanceType           = "m6i.4xlarge"
        RootDiskType           = "gp3"
        RootDiskSize           = "250"
        NvramDiskType          = "gp3"
        NvramDiskSize          = "10"
        MetadataDiskType       = "gp3"
        PerMetadataDiskSize    = "1024"
        MetadataDiskDefaultNum = "10"
      }
      "256TBModelm6i.8xlarge" = {
        InstanceType           = "m6i.8xlarge"
        RootDiskType           = "gp3"
        RootDiskSize           = "250"
        NvramDiskType          = "gp3"
        NvramDiskSize          = "10"
        MetadataDiskType       = "gp3"
        PerMetadataDiskSize    = "2048"
        MetadataDiskDefaultNum = "13"
      }
      "16TBModelm5.xlarge" = {
        InstanceType           = "m5.xlarge"
        RootDiskType           = "gp3"
        RootDiskSize           = "250"
        NvramDiskType          = "gp3"
        NvramDiskSize          = "10"
        MetadataDiskType       = "gp3"
        PerMetadataDiskSize    = "1024"
        MetadataDiskDefaultNum = "2"
      }
      "32TBModelm5.2xlarge" = {
        InstanceType           = "m5.2xlarge"
        RootDiskType           = "gp3"
        RootDiskSize           = "250"
        NvramDiskType          = "gp3"
        NvramDiskSize          = "10"
        MetadataDiskType       = "gp3"
        PerMetadataDiskSize    = "1024"
        MetadataDiskDefaultNum = "4"
      }
      "96TBModelm5.4xlarge" = {
        InstanceType           = "m5.4xlarge"
        RootDiskType           = "gp3"
        RootDiskSize           = "250"
        NvramDiskType          = "gp3"
        NvramDiskSize          = "10"
        MetadataDiskType       = "gp3"
        PerMetadataDiskSize    = "1024"
        MetadataDiskDefaultNum = "10"
      }
      "256TBModelm5.8xlarge" = {
        InstanceType           = "m5.8xlarge"
        RootDiskType           = "gp3"
        RootDiskSize           = "250"
        NvramDiskType          = "gp3"
        NvramDiskSize          = "10"
        MetadataDiskType       = "gp3"
        PerMetadataDiskSize    = "2048"
        MetadataDiskDefaultNum = "13"
      }
    }
    DdveMetadataDiskNumPerUserSelect = {
      "16TBModelm6i.xlarge" = {
        Default = "2"
        1       = "1"
        2       = "2"
        3       = "3"
        4       = "4"
        5       = "5"
        6       = "6"
        7       = "7"
        8       = "8"
        9       = "9"
        10      = "10"
        11      = "11"
        12      = "12"
        13      = "13"
        14      = "14"
        15      = "15"
        16      = "16"
        17      = "17"
        18      = "18"
        19      = "19"
        20      = "20"
        21      = "21"
        22      = "22"
        23      = "23"
        24      = "24"
      }
      "32TBModelm6i.2xlarge" = {
        Default = "4"
        1       = "1"
        2       = "2"
        3       = "3"
        4       = "4"
        5       = "5"
        6       = "6"
        7       = "7"
        8       = "8"
        9       = "9"
        10      = "10"
        11      = "11"
        12      = "12"
        13      = "13"
        14      = "14"
        15      = "15"
        16      = "16"
        17      = "17"
        18      = "18"
        19      = "19"
        20      = "20"
        21      = "21"
        22      = "22"
        23      = "23"
        24      = "24"
      }
      "96TBModelm6i.4xlarge" = {
        Default = "10"
        1       = "1"
        2       = "2"
        3       = "3"
        4       = "4"
        5       = "5"
        6       = "6"
        7       = "7"
        8       = "8"
        9       = "9"
        10      = "10"
        11      = "11"
        12      = "12"
        13      = "13"
        14      = "14"
        15      = "15"
        16      = "16"
        17      = "17"
        18      = "18"
        19      = "19"
        20      = "20"
        21      = "21"
        22      = "22"
        23      = "23"
        24      = "24"
      }
      "256TBModelm6i.8xlarge" = {
        Default = "13"
        1       = "1"
        2       = "2"
        3       = "3"
        4       = "4"
        5       = "5"
        6       = "6"
        7       = "7"
        8       = "8"
        9       = "9"
        10      = "10"
        11      = "11"
        12      = "12"
        13      = "13"
        14      = "14"
        15      = "15"
        16      = "16"
        17      = "17"
        18      = "18"
        19      = "19"
        20      = "20"
        21      = "21"
        22      = "22"
        23      = "23"
        24      = "24"
      }
      "16TBModelm5.xlarge" = {
        Default = "2"
        1       = "1"
        2       = "2"
        3       = "3"
        4       = "4"
        5       = "5"
        6       = "6"
        7       = "7"
        8       = "8"
        9       = "9"
        10      = "10"
        11      = "11"
        12      = "12"
        13      = "13"
        14      = "14"
        15      = "15"
        16      = "16"
        17      = "17"
        18      = "18"
        19      = "19"
        20      = "20"
        21      = "21"
        22      = "22"
        23      = "23"
        24      = "24"
      }
      "32TBModelm5.2xlarge" = {
        Default = "4"
        1       = "1"
        2       = "2"
        3       = "3"
        4       = "4"
        5       = "5"
        6       = "6"
        7       = "7"
        8       = "8"
        9       = "9"
        10      = "10"
        11      = "11"
        12      = "12"
        13      = "13"
        14      = "14"
        15      = "15"
        16      = "16"
        17      = "17"
        18      = "18"
        19      = "19"
        20      = "20"
        21      = "21"
        22      = "22"
        23      = "23"
        24      = "24"
      }
      "96TBModelm5.4xlarge" = {
        Default = "10"
        1       = "1"
        2       = "2"
        3       = "3"
        4       = "4"
        5       = "5"
        6       = "6"
        7       = "7"
        8       = "8"
        9       = "9"
        10      = "10"
        11      = "11"
        12      = "12"
        13      = "13"
        14      = "14"
        15      = "15"
        16      = "16"
        17      = "17"
        18      = "18"
        19      = "19"
        20      = "20"
        21      = "21"
        22      = "22"
        23      = "23"
        24      = "24"
      }
      "256TBModelm5.8xlarge" = {
        Default = "13"
        1       = "1"
        2       = "2"
        3       = "3"
        4       = "4"
        5       = "5"
        6       = "6"
        7       = "7"
        8       = "8"
        9       = "9"
        10      = "10"
        11      = "11"
        12      = "12"
        13      = "13"
        14      = "14"
        15      = "15"
        16      = "16"
        17      = "17"
        18      = "18"
        19      = "19"
        20      = "20"
        21      = "21"
        22      = "22"
        23      = "23"
        24      = "24"
      }
    }
    DdveConfigPerRegion = {
      us-east-1 = {
        RegionName     = "US East (N. Virginia)"
        AmiId          = "ami-0804d0e85996dd88d"
        AmiDescription = "7.12.0.0-1053185"
      }
      us-east-2 = {
        RegionName     = "US East (Ohio)"
        AmiId          = "ami-0e878897f7e63840d"
        AmiDescription = "7.12.0.0-1053185"
      }
      us-west-1 = {
        RegionName     = "US West (N. California)"
        AmiId          = "ami-0214639e9b8d9720c"
        AmiDescription = "7.12.0.0-1053185"
      }
      us-west-2 = {
        RegionName     = "US West (Oregon)"
        AmiId          = "ami-0dad3109c1bfb49bc"
        AmiDescription = "7.12.0.0-1053185"
      }
      af-south-1 = {
        RegionName     = "Africa (Cape Town)"
        AmiId          = "ami-0f1d6c76335daf7ab"
        AmiDescription = "7.12.0.0-1053185"
      }
      ap-east-1 = {
        RegionName     = "Asia Pacific (Hong Kong)"
        AmiId          = "ami-0b82bcc9decb440c6"
        AmiDescription = "7.12.0.0-1053185"
      }
      ap-south-2 = {
        RegionName     = "Asia Pacific (Hyderabad)"
        AmiId          = "ami-0f08fd39d54922c06"
        AmiDescription = "7.12.0.0-1053185"
      }
      ap-southeast-3 = {
        RegionName     = "Asia Pacific (Jakarta)"
        AmiId          = "ami-0c56ff39f413475df"
        AmiDescription = "7.12.0.0-1053185"
      }
      ap-southeast-4 = {
        RegionName     = "Asia Pacific (Melbourne)"
        AmiId          = "ami-0b49a787938bba858"
        AmiDescription = "7.12.0.0-1053185"
      }
      ap-south-1 = {
        RegionName     = "Asia Pacific (Mumbai)"
        AmiId          = "ami-01960a6b9f2139034"
        AmiDescription = "7.12.0.0-1053185"
      }
      ap-northeast-3 = {
        RegionName     = "Asia Pacific (Osaka)"
        AmiId          = "ami-0f4280c55bea7300f"
        AmiDescription = "7.12.0.0-1053185"
      }
      ap-northeast-2 = {
        RegionName     = "Asia Pacific (Seoul)"
        AmiId          = "ami-0fe3fd8e524dc9abf"
        AmiDescription = "7.12.0.0-1053185"
      }
      ap-southeast-1 = {
        RegionName     = "Asia Pacific (Singapore)"
        AmiId          = "ami-0690331f6ea0949d5"
        AmiDescription = "7.12.0.0-1053185"
      }
      ap-southeast-2 = {
        RegionName     = "Asia Pacific (Sydney)"
        AmiId          = "ami-0e4a93b5a144e9962"
        AmiDescription = "7.12.0.0-1053185"
      }
      ap-northeast-1 = {
        RegionName     = "Asia Pacific (Tokyo)"
        AmiId          = "ami-04e3d1f3569868621"
        AmiDescription = "7.12.0.0-1053185"
      }
      ca-central-1 = {
        RegionName     = "Canada (Central)"
        AmiId          = "ami-05f7bf5cc5b482654"
        AmiDescription = "7.12.0.0-1053185"
      }
      eu-central-1 = {
        RegionName     = "Europe (Frankfurt)"
        AmiId          = "ami-0c9f4b8c53cae4272"
        AmiDescription = "7.12.0.0-1053185"
      }
      eu-west-1 = {
        RegionName     = "Europe (Ireland)"
        AmiId          = "ami-002c78123761806ff"
        AmiDescription = "7.12.0.0-1053185"
      }
      eu-west-2 = {
        RegionName     = "Europe (London)"
        AmiId          = "ami-0a5060534cb4ad410"
        AmiDescription = "7.12.0.0-1053185"
      }
      eu-south-1 = {
        RegionName     = "Europe (Milan)"
        AmiId          = "ami-0e89f667a7bbc816d"
        AmiDescription = "7.12.0.0-1053185"
      }
      eu-west-3 = {
        RegionName     = "Europe (Paris)"
        AmiId          = "ami-06d40217e6033572c"
        AmiDescription = "7.12.0.0-1053185"
      }
      eu-south-2 = {
        RegionName     = "Europe (Spain)"
        AmiId          = "ami-0cbb503d93a83b395"
        AmiDescription = "7.12.0.0-1053185"
      }
      eu-north-1 = {
        RegionName     = "Europe (Stockholm)"
        AmiId          = "ami-039e6657b8667e36f"
        AmiDescription = "7.12.0.0-1053185"
      }
      eu-central-2 = {
        RegionName     = "Europe (Zurich)"
        AmiId          = "ami-093f2f16e45c004f2"
        AmiDescription = "7.12.0.0-1053185"
      }
      me-south-1 = {
        RegionName     = "Middle East (Bahrain)"
        AmiId          = "ami-0842271bef029ebe5"
        AmiDescription = "7.12.0.0-1053185"
      }
      me-central-1 = {
        RegionName     = "Middle East (UAE)"
        AmiId          = "ami-085bdc743d8ab8cfd"
        AmiDescription = "7.12.0.0-1053185"
      }
      sa-east-1 = {
        RegionName     = "South America (Sao Paulo)"
        AmiId          = "ami-0aacd06c3daface5a"
        AmiDescription = "7.12.0.0-1053185"
      }
      us-gov-west-1 = {
        RegionName     = "AWS GovCloud (US West)"
        AmiId          = "ami-083c094585070393f"
        AmiDescription = "7.12.0.0-1053185"
      }
      us-gov-east-1 = {
        RegionName     = "AWS GovCloud (US East)"
        AmiId          = "ami-07fcfd619061f0a66"
        AmiDescription = "7.12.0.0-1053185"
      }
    }
  }
}
