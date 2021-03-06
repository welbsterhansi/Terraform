# Terraform
![logoterraform](https://4matt.com.br/wp-content/uploads/2020/09/TerraForm-Logo-2.png)
Atlantic Institute presentation

### What is terraform?

Terraform is an infrastructure as code (IaC) tool that allows you to build, change, and version infrastructure safely and efficiently. This includes low-level components such as compute instances, storage, and networking, as well as high-level components such as DNS entries, SaaS features, etc. Terraform can manage both existing service providers and custom in-house solutions.

### What Is Immutable Infrastructure?

In a traditional mutable server infrastructure, servers are continually updated and modified in place. Engineers and administrators working with this kind of infrastructure can SSH into their servers, upgrade or downgrade packages manually, tweak configuration files on a server-by-server basis, and deploy new code directly onto existing servers. In other words, these servers are mutable; they can be changed after they’re created. Infrastructure comprised of mutable servers can itself be called mutable, traditional, or (disparagingly) artisanal.

An immutable infrastructure is another infrastructure paradigm in which servers are never modified after they’re deployed. If something needs to be updated, fixed, or modified in any way, new servers built from a common image with the appropriate changes are provisioned to replace the old ones. After they’re validated, they’re put into use and the old ones are decommissioned.

### Configuration Syntax

This low-level syntax of the Terraform language is defined in terms of a syntax called HCL, which is also used by configuration languages in other applications, and in particular other HashiCorp products. It is not necessary to know all of the details of HCL syntax in order to use Terraform, and so this page summarizes the most important details. If you are interested, you can find a full definition of HCL syntax

A block is a container for other content:

```
resource "aws_instance" "example" {
  ami = "abc123"

  network_interface {
    # ...
  }
}
```

### How does it work?

![fluxo](https://drek4537l1klr.cloudfront.net/winkler/v-8/Figures/02_10.png)

### Remote State:

![state](https://miro.medium.com/max/691/1*sYfCr4Jlo_6nDmgclWjxVg.png)

### How To install awscli?

font: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html

Install aws cli on linux:

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
aws configure list
```
Configure cli with iam user:

```
aws configure
AWS Access Key ID [None]: 
AWS Secret Access Key [None]: 
Default region name [None]: 
Default output format [None]: 
```
