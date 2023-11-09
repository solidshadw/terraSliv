## Terraform Walk-Through

<mark>Please refer to the [SETUP](https://github.com/solidshadw/terraSliv/blob/main/SETUP.md) document, if you don't have AWS cli and Terraform installed. You will also need to setup some AWS credentials.</mark>

### Git Clone Command - if not already done.

```
git clone https://github.com/solidshadw/terraSliv.git
```

## 3: Base Configuration

Rename the following "example" to your desired name:
```
resource "aws_vpc" "example"
resource "aws_internet_gateway" "example"
resource "aws_subnet" "example"
resource "aws_route_table" "example"
resource "aws_route" "default_route"
resource "aws_route_table_association" "example"
resource "aws_security_group" "example"
resource "aws_instance" "example"

value = aws_instance.example.public_ip
```

Once your have chosen your friendly names, update the associated references in the main.tf file.  
Each line below represents a reference that needs to be updated.
```
vpc_id          = aws_vpc.example.id
vpc_id          = aws_vpc.example.id
vpc_id          = aws_vpc.example.id
route_table_id  = aws_route_table.example.id
gateway_id      = aws_internet_gateway.example.id
subnet_id       = aws_subnet.example.id
route_table_id  = aws_route_table.example.id
vpc_id          = aws_vpc.example.id
subnet_id       = aws_subnet.example.id 
aws_security_group.example.id

value = aws_instance.example.public_ip
```
Modify the security group with your current IP.

```
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["66.0.0.97/32"] # Change this to your current ip
  }
    ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["66.0.0.97/32"] # Change this to your current ip
  }
    ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["66.0.0.97/32"] # Change this to your current ip
  }
```

# 4: Terraform Commands
1. `terraform init` is used to initialize a new or existing Terraform project.
When you run this command in a directory containing your Terraform configuration files (usually with a main.tf file), Terraform initializes the working directory by downloading any required provider plugins and modules defined in your configuration.
```bash
terraform init
```
2. `terraform fmt` is used to format (auto-format) your Terraform configuration files to adhere to a consistent and standardized style.
```bash
terraform fmt
```
3. `terraform plan` is used to create an execution plan for your Terraform configuration.
When you run this command, Terraform analyzes your configuration and infrastructure state and provides a detailed preview of the changes it's going to make when you apply your configuration.

```bash 
terraform plan
```

4. `terraform apply` is used to apply the changes defined in your Terraform configuration to your infrastructure. After running `terraform plan` and reviewing the execution plan, you can use `terraform apply` to enact the changes. This command will create, update, or delete resources as specified in your configuration.
```bash
terraform apply
```
5. <mark>USE only to destroy environment</mark>
`terraform destroy` is used to destroy the infrastructure and resources created by your Terraform configuration.
When you run this command, Terraform will determine which resources are managed by your configuration and initiate the process of destroying them
```bash
terraform destroy
```