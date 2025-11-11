# terraform-aws-neptune 
A Terraform module for deploying AWS NEPTUNE Cluster

## Example Usage
See the `examples/` folder

## Requiremenets

## Providers

## Module

## Resources

## Inputs

## Outputs

## Features

### How to connect to Neptune Cluster from Ec2 instance

1. From EC2 instances:
  1. `sudo su -`
  2. `cd home/ec2-user`
  3. `vi .bashrc`
2. Add following commands to .bashrc file and save:
  1. `TOKEN=$( curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600" )`
  2. `role_name=$( curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/iam/security-credentials/ )`
  3. `creds_json=$( curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/iam/security-credentials/${role_name} )`
 
  4. `export AWS_ACCESS_KEY_ID=$(echo "$creds_json" | jq .AccessKeyId |tr -d '"')`
  5. `export AWS_SECRET_ACCESS_KEY=$(echo "$creds_json" | jq .SecretAccessKey| tr -d '"')`
  6. `export AWS_SESSION_TOKEN=$(echo "$creds_json" | jq .Token|tr -d '"')`
 
  7. `export SERVICE_REGION=us-east-2`     

3. Run following command to check the status (uese cluster endpoint not instance endpoint):
  1. `curl https://<ClusterEndpoint>:8182/status` 


## Contributing

