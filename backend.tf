terraform {
    backend "s3" {
        bucket = "talent-academy-sathyaraj-lab-tfstates1"
        key = "talent-academy/backend/terraform.tfstates"
        dynamodb_table = "terraform-lock"
    }
}