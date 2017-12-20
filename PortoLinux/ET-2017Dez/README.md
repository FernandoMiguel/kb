# Porto Linux - Encontro técnico de Dezembro 2017
    - Apresentações
        - Terraform, VSCode, and AWS Security by Fernando Pereira

<!-- TOC -->

- [Porto Linux - Encontro técnico de Dezembro 2017](#porto-linux---encontro-técnico-de-dezembro-2017)
    - [Visual Studio Code](#visual-studio-code)
    - [AWS Security](#aws-security)
        - [MFA and STS](#mfa-and-sts)
            - [Cross Account](#cross-account)
        - [aws-vault](#aws-vault)
    - [Infrastructure as Code](#infrastructure-as-code)
        - [Terraform](#terraform)
        - [Terragrunt](#terragrunt)

<!-- /TOC -->

## Visual Studio Code
Visual Studio Code is a source code editor developed by Microsoft for Windows, Linux and macOS. It includes support for debugging, embedded Git control, syntax highlighting, intelligent code completion, snippets, and code refactoring. --Wikipedia

https://code.visualstudio.com/

* Open Source IDE
* Native support for code source repositories
* Extenstions available


## AWS Security

### MFA and STS

* MFA https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_users-self-manage-mfa-and-creds.html
* STS https://docs.aws.amazon.com/STS/latest/APIReference/Welcome.html
* AWS Organisations https://aws.amazon.com/organizations/
* Cross Account https://github.com/FernandoMiguel/AWS-Trust-CrossAccounts

#### Cross Account

* Multi account diagram https://www.draw.io/#G19-9YsZenbH8DKEt9SO3rUDxIBcmf0JVy

![Diagram](img/MultiAccountDiagram.svg)

### aws-vault

Securely store and access credentials for AWS. AWS Vault stores IAM credentials in your operating systems secure keystore and then generates temporary credentials from those to expose to your shell and applications. It's designed to be complementary to the aws cli tools, and is aware of your profiles and configuration in ~/.aws/config.

* aws-vault https://github.com/99designs/aws-vault
* aws config example https://github.com/FernandoMiguel/kb/blob/master/aws/config
* [aws-vault cheat guide](../../aws-vault/README.md)

## Infrastructure as Code

Infrastructure as code (IaC) is the process of managing and provisioning computer data centers through machine-readable definition files, rather than physical hardware configuration or interactive configuration tools. --Wikipedia

Infrastructure as code can be a key attribute of enabling best practices in **DevOps** --Wikipedia

Examples:
* Ansible
* Puppet
* Chef

For Public Cloud:
* Azure Infrastructure ARM templates
* AWS Cloudformation
* Terraform

### Terraform

* Terraform https://www.terraform.io/
* Module Registry https://registry.terraform.io/

The syntax of Terraform configurations is called HashiCorp Configuration Language (HCL).

* [Guide](terraform/README.md)
* Book https://terraformbook.com/
* awesome terraform https://github.com/shuaibiyy/awesome-terraform


### Terragrunt

Terragrunt is a thin wrapper for Terraform that provides extra tools for keeping your Terraform configurations DRY, working with multiple Terraform modules, and managing remote state.

* https://github.com/gruntwork-io/terragrunt/

DRY don't repeat yourself 