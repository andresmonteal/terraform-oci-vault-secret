# OCI Vault Secrets Module

This Terraform module deploys secrets in Oracle Cloud Infrastructure (OCI) Vault. It supports generating SSH key pairs and storing them as secrets.

## Features

- Creates secrets in OCI Vault.
- Can generate SSH key pairs and store them as secrets if specified.

## Prerequisites

Before using this module, make sure you have the following:

- OCI account credentials with the necessary permissions to create resources.
- Terraform (v1.0.0 or above) installed and configured correctly.
- Terraform OCI provider (v4.96.0 or above) installed and configured correctly.

## Usage
To use this module, include it in your Terraform configuration and specify the required input variables. Here's a basic example of how to use the module:

```hcl
module "vault_secrets" {
  source             = "path_to_module"
  tenancy_ocid       = "your_tenancy_ocid"
  compartment        = "your_compartment_name"
  vault              = "your_vault_name"
  name               = "secret_name"
  description        = "your_secret_description"
  content_type       = "content_type"
  content            = "content_value"
  type               = "ssh"
  defined_tags       = {}
  freeform_tags      = {}
}
```

Replace "path_to_module" with the path to the module directory or the Git repository URL.
Replace the values with your specific requirements.

## Variables
Before using this module, you must configure the required variables. These can be set in a terraform.tfvars file for easy module configuration.

| Name                | Description                                                  | Type        | Default | Required |
|---------------------|--------------------------------------------------------------|-------------|---------|----------|
| tenancy_ocid        | The OCID of the root compartment.                            | string      | null    | yes      |
| compartment         | The name of the compartment where to create all resources.   | string      | null    | yes      |
| vault               | The name of the vault where you want to create the secret.   | string      | null    | yes      |
| name                | A user-friendly name for the secret.                         | string      | -       | yes      |
| key_id           | The OCID of the master encryption key that is used to encrypt the secret. | string  | null  | yes  |
| compartment_id      | The OCID of the compartment where the secret will be created.| string      | null    | no       |
| vault_id            | The OCID of the vault where the secret will be created.      | string      | null    | no       |
| description         | A brief description of the secret.                           | string      | null    | no       |
| content_type        | The content type of the secret.                              | string      | "BASE64"| no       |
| content             | The base64-encoded content of the secret.                    | string      | null    | no       |
| content_name        | The name of the content.                                     | string      | "1"     | no       |
| freeform_tags       | Free-form tags for this resource.                             | map(string) | null    | no       |
| defined_tags        | Defined tags for this resource.                               | map(string) | null    | no       |
| management_endpoint | The service endpoint to perform management operations against. | string    | null    | no       |
| type                | If "ssh", generates key pair and correspondingsecrets.       | string      | null    | no       |

**Note:** If `compartment_id` is provided, it will override the `compartment` variable.
**Note:** If `vault_id` is provided, it will override the `vault` variable.

## Outputs

| Name                | Description                    |
|---------------------|--------------------------------|
| secret_id           | Secret id                      |
| public_ssh_key_id   | Public SSH key secret id       |
| secret_content      | Secret content                 |
| public_ssh_key      | Public SSH key secret content  |

## Notes
- Ensure that you have the necessary IAM permissions to create resources in the specified compartments and VCN.
- Review and customize the module inputs according to your specific requirements.
- For more information on DNS Views in OCI and its configuration options, refer to the [OCI documentation](https://docs.oracle.com/en-us/iaas/Content/KeyManagement/Tasks/managingsecrets.htm).
