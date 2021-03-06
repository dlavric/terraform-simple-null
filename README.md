# Repository for learning Terraform
This repository is for running Terraform with the `Null provider` for learning purposes

## This Repository creates a Null provider with Terraform

## Instructions

### Prerequisites

- [X] [Terraform](https://www.terraform.io/downloads)

## How to Use this Repo

- Clone this repository:
```shell
git clone git@github.com:dlavric/terraform-simple-null.git
```

- Go to the directory where the repo is stored and make sure you also have the `main.tf` file there:
```shell
cd terraform-simple-null
```

- Run `terraform init`, to download any external dependency
```shell
terraform init
```

The output should look like this:

```shell
Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/null...
- Installing hashicorp/null v3.1.0...
- Installed hashicorp/null v3.1.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

- Apply the changes with Terraform
```shell
terraform apply
```

The output looks like this:
```shell
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.null will be created
  + resource "null_resource" "null" {
      + id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

null_resource.null: Creating...
null_resource.null: Creation complete after 0s [id=8645756374524357754]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

- To confirm how many resources have been created
```shell
terraform state list
```

- Destroy the instance
```shell
terraform destroy
```

The results for destroying the instance will look like this:
```shell
null_resource.null: Refreshing state... [id=8645756374524357754]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # null_resource.null will be destroyed
  - resource "null_resource" "null" {
      - id = "8645756374524357754" -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

null_resource.null: Destroying... [id=8645756374524357754]
null_resource.null: Destruction complete after 0s

Destroy complete! Resources: 1 destroyed.
```