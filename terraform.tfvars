project_id = "project-802f7e50-ee4f-44a7-8c5"

region = "us-east1"

bucket_name = "kritika-private-bucket-001"


#vpc creation

vpc_name = "terraform-vpc"

subnet_name = "terraform-subnet"

subnet_cidr = "10.10.0.0/24"

firewall_name = "allow-ssh-http"


#vm creation

vm_name = "terraform-vm"

machine_type = "e2-small"

zone = "us-east1-b"

image = "debian-cloud/debian-12"


#automatic snapshot 

snapshot_policy_name = "daily-snapshot-policy"

snapshot_start_time = "02:00"

snapshot_retention_days = 7

