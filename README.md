# High Secure App using AWS and Terraform
This repository contains Terraform code that deploys a high secure app on AWS. The app includes an EC2 instance running Ubuntu 20.04, a VPC with public and private subnets, and security groups that allow inbound traffic to the app only from specific IP addresses.

## Prerequisites
Before you can use this repository, you need to have the following:

1- An AWS account
2- The AWS CLI installed and configured on your local machine
3- Terraform installed on your local machine

### How to Use
Clone the repository to your local machine.
Navigate to the terraform directory.
Run terraform init to initialize the project.
Run terraform plan to review the infrastructure changes that will be made.
If you're satisfied with the plan, run terraform apply to create the infrastructure on AWS.
After the infrastructure is created, you can log in to the EC2 instance using the key pair you created during the Terraform apply process.
How to Connect to the App
Open the AWS Management Console and navigate to the EC2 Dashboard.

Select the instance you created during the Terraform apply process.

Click the "Connect" button at the top of the screen.

Follow the instructions to connect to the instance using the key pair you created during the Terraform apply process.

Once you are connected to the instance, run the following command to start the app:

```
sudo docker run -p 80:80 nginx
```
The app is now running on the instance, and you can access it from a web browser by entering the public IP address of the instance in the address bar.

### Notes
By default, the security group allows inbound traffic to the app only from the IP address you used to create the infrastructure. If you need to allow additional IP addresses to access the app, you can modify the security group rules in the Terraform code and re-run terraform apply.
This repository is intended for demonstration purposes only and should not be used in production environments without additional security hardening.
