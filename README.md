# Terraform
![logoterraform](https://4matt.com.br/wp-content/uploads/2020/09/TerraForm-Logo-2.png)
Atlantic Institute presentation

### What is terraform?

Terraform is an infrastructure as code (IaC) tool that allows you to build, change, and version infrastructure safely and efficiently. This includes low-level components such as compute instances, storage, and networking, as well as high-level components such as DNS entries, SaaS features, etc. Terraform can manage both existing service providers and custom in-house solutions.

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
