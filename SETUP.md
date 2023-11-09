# Automating deployment of sliver in Terraform
# Instructions:  Base Configuration

## Prerequisites -- To be done **BEFORE** to setup environment
* AWS Account
* AWS CLI
* Terraform
* Git
* Text Editor (VSCode)

## AWS Account
You will need your own AWS account.

If you do not already have an AWS account, you can create one [here](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/).  You will need to provide a credit card to create an AWS account.  Services created today have little to no cost depending on how long you leave them running.  If this a new AWS account all services will be free.  If you are over the free-tier limit, you will be charged around $1.00 for the services created today.

## AWS CLI
The AWS CLI is a command line tool that allows you to interact with AWS services.  Once you have the AWS CLI installed, you will need to configure it with your AWS credentials.

Download the CLI
```bash
https://aws.amazon.com/cli/
```

Using the GUI generate an Access Key
```
## Generate Access Key
1. Login to AWS Console: https://console.aws.amazon.com/
2. Click on your name in the top right corner
3. Click on "Security Credentials"
5. Click on "Create Access Key"
    ** Select Command Line Interface(CLI)
    ** Click I understand... then next
    ** Name the key
6. Click on Secret Access Key "show"
7. Copy Access Key and Secret Key to Notepad
8. Click on "Download .csv file" (Optional)
9. Click on "Done"
```
## AWS CLI Authentication

```bash
aws configure
```
```bash
AWS Access Key ID: <enter your access key>
AWS Secret Access Key: <enter your secret key>
Default region name: us-east-1
```
Test the CLI
```bash
aws sts get-caller-identity
```
## Terraform Install
Terraform is an open source tool that allows you to automate the creation of cloud resources.  You can download Terraform [here](https://www.terraform.io/downloads.html).  Once you have Terraform installed, you will need to add it to your PATH.  You can find instructions on how to do that [here](https://stackoverflow.com/questions/14637979/how-to-permanently-set-path-on-linux-unix).

## Text Editor Install
You will need a text editor to edit the Terraform files.  You can use any text editor you like, but I recommend using [Visual Studio Code](https://code.visualstudio.com/).

Install VScode on your local workstation with the following extensions:
* HashiCorp Terraform
* Markdown (Markdown All in One-Yu Zhang 7 Million Downloads)(Control-shift-v)