# Game Server Infrastructure with Terraform

This repository contains Terraform configurations for deploying two game servers – Minecraft and Urban Terror – to Linode.

## Prerequisites

*   A Linode account.
*   The Terraform CLI installed on your local machine.
*   Basic understanding of Terraform and Infrastructure as Code.

## Deployment Steps

1.  **Create a Linode API Token:**
    *   Log in to your Linode account.
    *   Navigate to your profile settings and generate a new API token with read/write permissions.
    *   Refer to the [Linode API Token Documentation](https://techdocs.akamai.com/cloud-computing/docs/manage-personal-access-tokens) for detailed instructions.

2.  **Clone the Repository:**
    ```bash
    git clone <repository_url>
    cd <repository_directory>
    ```

3.  **Configure Terraform Variables:**
    *   Copy the `terraform.tfvars.example` file to `terraform.tfvars`.
    *   Update the variables in `terraform.tfvars` with your Linode API token, region, and other required configurations.

4.  **Initialize Terraform:**
    ```bash
    terraform init
    ```

5.  **Plan the Deployment:**
    ```bash
    terraform plan
    ```

6.  **Apply the Configuration:**
    ```bash
    terraform apply
    ```
    Confirm the deployment by typing `yes` when prompted.

## Terraform Configuration Files

*   `main.tf`: Contains the main Terraform configuration for provisioning the Linode instances and configuring the game servers.
*   `variables.tf`: Defines the variables used in the Terraform configuration.
*   `terraform.tfvars.example`: Provides an example of how to configure the Terraform variables.

## Additional Information

*   Refer to the Linode Terraform provider documentation for more details on available resources and configuration options: [https://registry.terraform.io/providers/linode/linode/latest/docs](https://registry.terraform.io/providers/linode/linode/latest/docs)