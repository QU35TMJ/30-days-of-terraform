# Day 02 - Validate Your Terraform Environment

Day 2 is about verifying that the environment set up on Day 1 is fully working and understanding
how the tools connect to each other. The focus shifts from installation to validation 
confirming that Terraform can actually authenticate with AWS and is ready to deploy
real infrastructure.

---


1. **Environment Validation**
   - Ran all four validation commands and confirmed clean output
   - Verified IAM user credentials are correctly configured via shared credentials file
   - Confirmed default region is set. Mine is set to `eu-north-1`

2. **Reading**
   - Read Chapter 2 of *Terraform: Up & Running* by Yevgeniy Brikman
   - Focus areas: AWS account setup, Terraform installation, and how Terraform
     authenticates with AWS

3. **Blog Post**
   - Published: *Step-by-Step Guide to Setting Up Terraform, AWS CLI, and Your AWS Environment*
   - Link: https://dev.to/mj16/step-by-step-guide-setting-up-terraform-aws-cli-and-your-aws-environment-51j9

---

## Setup Validation
```bash
$ terraform version
Terraform v1.15.3
on windows_amd64
```

```bash
$ aws --version
aws-cli/2.31.29 Python/3.13.9 Windows/10 exe/AMD64
```

```bash
$ aws configure list
NAME       : VALUE                    : TYPE             : LOCATION
profile    : <not set>                : None             : None
access_key : ****************OUGP     : shared-credentials-file :
secret_key : ****************8vNk     : shared-credentials-file :
region     : eu-north-1               : config-file      : ~/.aws/config

```

```bash
$ aws sts get-caller-identity
{
    "UserId": "AIDAR**********",
    "Account": "0836******",
    "Arn": "arn:aws:iam::0836*******:user/terraform"
}

```
---

## VS Code Extensions

- HashiCorp Terraform
- AWS Toolkit

---

## Chapter 2 Learnings

**How Terraform authenticates with AWS**

Terraform does not have its own authentication system. It uses the same credential
chain as the AWS CLI and SDKs. When you run a Terraform command, it looks for
credentials in this order: environment variables (`AWS_ACCESS_KEY_ID` and
`AWS_SECRET_ACCESS_KEY`), then the shared credentials file at
`~/.aws/credentials`, then IAM roles attached to the resource running Terraform.

In my setup, credentials are stored in the shared credentials file, which is
what `aws configure` creates automatically. The `aws configure list` output
confirms this — the `TYPE` column shows `shared-credentials-file` for both
the access key and secret key.

**Why not use the root account?**

The root user has unrestricted access to everything in the AWS account — billing,
IAM, all services. If those credentials were leaked or misused, the damage would
be total. A dedicated IAM user like `terraform` can be scoped to only what
Terraform needs, and if something goes wrong, the blast radius is contained.
The book makes this point clearly: create the IAM user immediately after
setting up the account, then never use root credentials for day-to-day work.

**Declarative vs procedural**

Chapter 2 reinforces something important about how Terraform works. You describe
the end state you want — one EC2 instance of type t2.micro with a specific AMI —
and Terraform figures out the API calls needed to get there. This is different
from writing a script that runs steps in order. If the resource already exists,
Terraform compares what is deployed against what is in the code and only makes
the difference. That `Refreshing state...` line in the apply output is Terraform
doing exactly that check.

**The .gitignore pattern**

The book recommends committing `main.tf` and `.terraform.lock.hcl` but ignoring
the `.terraform` folder and all `*.tfstate` files. The `.terraform` folder is
a scratch directory for downloaded provider plugins — it can be regenerated with
`terraform init`. State files contain sensitive data about real infrastructure
and should never be in a public repository.

---

## Next Steps

- Write the first Terraform configuration file
- Deploy a single EC2 instance using `terraform init`, `terraform plan`,
  and `terraform apply`
- Understand how Terraform state tracks what it has already created
