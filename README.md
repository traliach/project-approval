# Project Approval Main 🎉

## Project 1: Install and Configure Jenkins to deploy Cloud resources using Terraform 🚀

### Steps:
1. **Set up an Ubuntu machine for Jenkins server 🖥️**
   - Provision an Ubuntu EC2 instance using Terraform.
   - **Link:** [Terraform EC2 Module](https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest)
2. **Install Jenkins on the server using Terraform 🔧**
   - Use a Terraform provisioner to install Jenkins on the provisioned EC2 instance.
   - **Link:** [Terraform Provisioners](https://www.terraform.io/docs/language/resources/provisioners/syntax.html)
3. **Configure Jenkins to deploy cloud resources using Terraform ☁️**
   - Set up Jenkins pipeline with Terraform scripts.
   - **Link:** [Using Jenkins to run Terraform](https://www.jenkins.io/doc/tutorials/create-a-pipeline-with-terraform/)
4. **Create a Terraform node and add it to the Jenkins server 🔗**
   - Provision another Ubuntu EC2 instance using Terraform and configure it as a node in Jenkins.
   - **Link:** [Managing Nodes in Jenkins](https://www.jenkins.io/doc/book/managing/nodes/)
5. **Install Terraform on the Terraform node using Terraform 🛠️**
   - Use a Terraform provisioner to install Terraform on the node.
   - **Link:** [Terraform Provisioners](https://www.terraform.io/docs/language/resources/provisioners/syntax.html)

## Project 2: Deploy EKS cluster and work on it 🌐

### Steps:
1. **Write Terraform scripts to deploy an EKS cluster 📜**
   - Create Terraform scripts to provision an EKS cluster.
   - **Link:** [EKS Terraform Module](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest)
2. **Configure the EKS cluster with necessary IAM roles 🔒**
   - Create IAM roles with required permissions.
   - **Link:** [IAM Roles for EKS](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles.html)
3. **Test the EKS deployment ✅**
   - Validate the EKS cluster by deploying a sample application.
   - **Link:** [Kubernetes Sample Deployment](https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/)

## Project 3: Configure S3 bucket and integrate Gmail 📧

### Steps:
1. **Create Terraform scripts to configure an S3 bucket for state management 🗃️**
   - Create and configure an S3 bucket for Terraform state management.
   - **Link:** [Terraform S3 Backend](https://www.terraform.io/docs/backends/types/s3.html)
2. **Integrate Gmail for notifications using Terraform ✉️**
   - Use Terraform to configure Gmail SMTP settings in Jenkins.
   - **Link:** [Jenkins Email Extension](https://plugins.jenkins.io/email-ext/)

## Project 4: Integrate Maven and SonarQube 📦

### Steps:
1. **Install and configure Maven on the Jenkins server using Terraform 🔨**
   - Install Maven and configure Jenkins to use it using Terraform.
   - **Link:** [Maven Integration with Jenkins](https://www.jenkins.io/doc/book/pipeline/maven/)
2. **Integrate SonarQube with Jenkins for code analysis using Terraform 🔍**
   - Install SonarQube and configure Jenkins for code analysis using Terraform.
   - **Link:** [SonarQube Jenkins Plugin](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner-for-jenkins/)
3. **Configure SonarQube to work with the existing infrastructure using Terraform 🛠️**
   - Update Terraform scripts to include SonarQube configurations.
   - **Link:** [SonarQube on AWS](https://aws.amazon.com/quickstart/architecture/sonarqube/)
4. **Launch the application on the created infrastructure 🚀**
   - Deploy the final application using Jenkins pipeline.
   - **Link:** [Jenkins Pipeline](https://www.jenkins.io/doc/book/pipeline/)

## Final Steps
1. **Build and deploy the application on the EKS cluster.**
   - Ensure all configurations are applied and the application runs smoothly.
   - **Link:** [Deploying Applications on EKS](https://docs.aws.amazon.com/eks/latest/userguide/deploying-applications.html)

