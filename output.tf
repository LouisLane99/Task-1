output "bucket_name" {
    value = google_storage_bucket.private_bucket.name
}

output "vpc_name"{
    value = google_compute_network.vpc.name
}

output "subnet_name"{
    value = google_compute_subnetwork.subnet.name
}

output "firewall_name"{
    value = google_compute_firewall.allow_ssh_http.name
}

output "vm_name"{
    description = "virtual machine name"
    value = google_compute_instance.vm.name
}


