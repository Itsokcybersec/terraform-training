resource "local_file" "terraform_debug" {
  filename = "terraformdebug.txt"
  content = "Terraform verbose mode"
}