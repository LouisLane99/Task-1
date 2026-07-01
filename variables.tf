variable "bucket_name" {
  type = string
}

variable "region" {
  type = string
}

variable "project_id" {
  type = string
}

# vpc variables

variable "vpc_name"{
   type = string
}

variable "subnet_name"{
  type = string
}

variable "subnet_cidr"{
  type = string
}

variable "firewall_name"{
  type = string
}

#creating a vm

variable "vm_name"{
  type = string
}

variable "machine_type"{
  type = string
}

variable "zone"{
  type = string
}
variable "image"{
  type = string
}

#creating a snapshot from the boot disk
variable "snapshot_policy_name"{
  type = string
}
variable "snapshot_start_time"{
  type = string
}
variable "snapshot_retention_days"{
  type = number
}
