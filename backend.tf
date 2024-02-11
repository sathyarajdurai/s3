terraform {
    backend "s3" {
        bucket = "talent-academy-sathyaraj-lab-tfstates-feb24"
        key = "talent-academy/s3/terraform.tfstates"
        dynamodb_table = "terraform-lock"
    }
}