# Challenge 2:
## Terraform

step 1.  Download Terraform from url : https://www.terraform.io/downloads.html according to your OS.

step 2. Please follow the instruction based on your OS.

step 3. run terraform command in cmd/powershell/bash shell.

step 4. Prepare the terraform files as attached in codebase

step 5. Please update the particular piece in varables.tf with your public key file.

      variable "key_path" {
        description = "SSH Public Key path"
        default = "C:/Users/rakesh/Desktop/PT/AWS/ec2-instance-2019.pub"
      }
      
step 6. commands to run:
     
     terraform init
     terraform plan     
     terraform apply

step 7. I have also attached terraform plan output in text format.

step 8. US-east-1 is the region used in demo.

step 9. test by doing ssh in ec2-devops instance using public IP from your personal laptop.

