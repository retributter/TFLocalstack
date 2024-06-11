![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)

# TF + Localstack in docker

I wanted to test back in the day for my certifications and also have some knowledge of Terraform,
decided to start this repository to include many of my findings and learnings over AWS and Terraform.

## Setting up the environment
Clone the repo
```
git clone https://github.com/retributter/TFLocalstack.git
```
Move to the folder and docker-compose up detached
```
cd TFLocalstack && docker-compose up -d
```
Enter docker container 
```
docker exec -it tflocalstack bash
```
[Create Basic IAM roles](https://docs.localstack.cloud/user-guide/aws/iam/)
```
apt update -y && \
awslocal sts get-caller-identity && \
awslocal iam create-user --user-name test2 && \
awslocal iam create-access-key --user-name test2 | jq '.AccessKey | {AccessKeyId, SecretAccessKey}'
```
The two value keys would be the SECRET_ID and SECRET_KEY
```
  "AccessKeyId": "LKIAQAAAAAAACCQR4JMH",
  "SecretAccessKey": "0CUWTtyAEv0gaNhJFovFjfLFO4GvT6qQPw3dLO7P"
```
Create a secret.tfvars and include the values you've obtained
```
touch secrets.tfvars
```
```
  aws_access_key = "LKIAQAAAAAAACCQR4JMH"
  aws_secret_key = "0CUWTtyAEv0gaNhJFovFjfLFO4GvT6qQPw3dLO7P"
  aws_region     = "us-east-1"
```
