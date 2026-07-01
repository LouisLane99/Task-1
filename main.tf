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

resource "google_compute_instance" "vm"{

    name = var.vm_name
    machine_type = var.machine_type
    zone = var.zone

    tags = ["web-server"]

    boot_disk{
        initialize_params{
            image= var.image
            size = 20
        }
    }
    network_interface{
        subnetwork = google_compute_subnetwork.subnet.id
        access_config{

        }
    }
}

resource "google_compute_resource_policy" "snapshot_policy"{

    name = var.snapshot_policy_name
    region = var.region

    snapshot_schedule_policy {
      
      schedule{
         
         daily_schedule {
           days_in_cycle = 1
        start_time    = var.snapshot_start_time
         }
      }

      retention_policy{
        max_retention_days    = var.snapshot_retention_days
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"

      }
      snapshot_properties {

      guest_flush = true

      storage_locations = [
        var.region
      ]
    }
    }
}


resource "google_compute_disk_resource_policy_attachment" "bootdisk_attachment" {

  name = google_compute_resource_policy.snapshot_policy.name

  disk = google_compute_instance.vm.boot_disk[0].source

  zone = var.zone
}