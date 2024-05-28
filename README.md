# Project Approval Main 🎉

## Project Structure

project-approval-main
│
├── jenkins_terraform_node
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ ├── jenkins_provision.tf
│ ├── terraform_node.tf
│ ├── terraform_install.tf
│ ├── user_data.sh
│ ├── terraform_install.sh
│ └── terraform.tfvars
│
├── eks_terraform_deploy
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ ├── test_deployment.yml
│ └── terraform.tfvars
│
├── s3_gmail_integration
│ ├── backend.tf
│ ├── s3_bucket.tf
│ ├── dynamodb_table.tf
│ └── terraform.tfvars
│
├── maven_sonarqube_integration
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ ├── maven_install.tf
│ ├── sonarqube_install.tf
│ ├── sonar_scanner_config.tf
│ └── terraform.tfvars
│
├── iam_roles
│ ├── main.tf
│ ├── variables.tf
│ └── terraform.tfvars
│
├── final_application_deployment
│ └── jenkinsfile
│
└── README.md


## Instructions

### 1. Set up Jenkins and Terraform Nodes
- **Step 1:** Navigate to `jenkins_terraform_node` and run `terraform init` and `terraform apply`.
- **Step 2:** SSH into the Jenkins server and start Jenkins using the command `sudo systemctl start jenkins`.

### 2. Deploy EKS Cluster
- **Step 1:** Navigate to `eks_terraform_deploy` and run `terraform init` and `terraform apply`.

### 3. Configure S3 Bucket and DynamoDB Table for State Management
- **Step 1:** Navigate to `s3_gmail_integration` and run `terraform init` and `terraform apply`.

### 4. Integrate Maven and SonarQube
- **Step 1:** Navigate to `maven_sonarqube_integration` and run `terraform init` and `terraform apply`.

### 5. Set Up IAM Roles
- **Step 1:** Navigate to `iam_roles` and run `terraform init` and `terraform apply`.

### 6. Configure Gmail in Jenkins
- **Step 1:** Open Jenkins GUI and navigate to `Manage Jenkins` -> `Configure System`.
- **Step 2:** Scroll to `Extended E-mail Notification` and configure your SMTP settings.
  - **SMTP Server:** `smtp.example.com`
  - **Default User E-mail Suffix:** `@example.com`
  - **Sender E-mail Address:** `jenkins@example.com`
  - **Reply-To Address:** `no-reply@example.com`
  - **SMTP Authentication:** Enable and enter your credentials.
  - **Use SSL:** Enable if your SMTP server requires it.
  - **SMTP Port:** `465` or `587` depending on your server.

### 7. Deploy Final Application
- **Step 1:** Navigate to `final_application_deployment` and configure the Jenkins pipeline using the `jenkinsfile`.

### Useful Links
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Jenkins Documentation](https://www.jenkins.io/doc/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [SonarQube Documentation](https://docs.sonarqube.org/latest/)

### Notes
- Ensure all Terraform scripts are correctly configured with your AWS credentials.
- Follow best practices for IAM roles and permissions.
- Verify all configurations and integrations in the Jenkins pipeline.

