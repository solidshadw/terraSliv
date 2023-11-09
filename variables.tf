###################
## EC2 Variables ##
###################

variable "ami-id" {
  #Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-10-30
  default = "ami-0e783882a19958fff"
}

variable "ssh-key-name" {
  description = "Name of the SSH keypair to use in AWS"
  type        = string
  default     = "sliverC2"
}

variable "instance_name" {
  description = "Value of Name tag for the EC2 instance"
  type        = string
  default     = "sliverC2-terraform"
}

variable "instance_type" {
  description = "The instance type"
  type        = string
  default     = "t2.micro"
}

################
## Networking ##
################

variable "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "subnet_cidr_block" {
  description = "The CIDR block of the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

#####################
## Security Groups ##
#####################

variable "sg_cidr_blocks_allow_ssh" {
  description = "The CIDR blocks of the security group"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "sg_cidr_blocks_allow_http" {
  description = "The CIDR blocks of the security group"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "sg_cidr_blocks_allow_https" {
  description = "The CIDR blocks of the security group"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

######################
## Provider Details ##
######################
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "The availablity zone"
  type        = string
  default     = "us-east-1a"
}