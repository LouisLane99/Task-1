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


output "snapshot_policy_name" {
  description = "Snapshot policy name"
  value       = google_compute_resource_policy.snapshot_policy.name
}

output "snapshot_policy_region" {
  description = "Region where the snapshot policy is created"
  value       = google_compute_resource_policy.snapshot_policy.region
}

output "snapshot_retention_days" {
  description = "Number of days snapshots are retained"
  value       = var.snapshot_retention_days
}

output "snapshot_start_time" {
  description = "Daily snapshot start time"
  value       = var.snapshot_start_time
}