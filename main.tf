terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.24.0"
    }
  }
  required_version = ">= 1.5.7"
}

provider "aws" {
  # Configuration options
  region = var.region
}

####################
## Create the VPC ##
####################
resource "aws_vpc" "sliverVPC" {
  cidr_block = var.vpc_cidr_block
}
#################################
## Create the Internet Gateway ##
#################################
resource "aws_internet_gateway" "sliverGateway" {
  vpc_id = aws_vpc.sliverVPC.id
}
#######################
## Create the Subnet ##
#######################
resource "aws_subnet" "sliverSubnet" {
  vpc_id            = aws_vpc.sliverVPC.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
}
############################
## Create the Route Table ##
############################
resource "aws_route_table" "sliverRouteTable" {
  vpc_id = aws_vpc.sliverVPC.id
}
##############################
## Create the Default Route ##
##############################
resource "aws_route" "sliverRoute" {
  route_table_id         = aws_route_table.sliverRouteTable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.sliverGateway.id
}
##################################
## Create the Route Association ##
##################################
resource "aws_route_table_association" "sliverAssociation" {
  subnet_id      = aws_subnet.sliverSubnet.id
  route_table_id = aws_route_table.sliverRouteTable.id
}

#############################################
## Create the Security Group  ##
#############################################
resource "aws_security_group" "main" {
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr_blocks_allow_ssh
    }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr_blocks_allow_http
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr_blocks_allow_https
  }
}


####################################
## Create the actual Ec2 Instance ##
####################################
resource "aws_instance" "sliver-c2" {
  ami           = var.ami-id        # Feed it the AMI you found
  instance_type = var.instance_type # Choose the size/type of compute you want
  key_name      = var.ssh-key-name  # Here is the public key you want for ssh.

  root_block_device {
    volume_size = 30    # If you wanted to increase the hard drive space here it is.
    volume_type = "gp3" # The type of storage you want to use.
    encrypted   = true
  }

  tags = {
    Name        = var.instance_name
    Terraform   = "true"
    Environment = "dev"
  }

  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.main.id # Add the security group you created.
  ]
  user_data = file("sliver_install.sh") # This is the script that will run on the instance.
}