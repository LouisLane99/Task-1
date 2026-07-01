resource "google_storage_bucket" "private_bucket" {

    name = var.bucket_name
    location = var.region

    storage_class = "STANDARD"

    uniform_bucket_level_access = true

    versioning {
        enabled = true
    }

    public_access_prevention = "enforced"
}

#vpc creation
resource "google_compute_network" "vpc"{
    name = var.vpc_name
    auto_create_subnetworks = false

}

#subnet creation
resource "google_compute_subnetwork" "subnet"{
    name = var.subnet_name
    ip_cidr_range = var.subnet_cidr
    region = var.region
    network = google_compute_network.vpc.id 
    }

#creating firewall rule 
resource "google_compute_firewall" "allow_ssh_http"{
    name = var.firewall_name
    network = google_compute_network.vpc.name
    direction = "INGRESS"

    allow{
        protocol ="tcp"
        ports =["22"]
    }
    allow{
        protocol = "tcp"
        ports =["80"]
    }
    source_ranges =["0.0.0.0/0"]
    target_tags = ["web-server"]
}

#vm Provisioning




