# flaskProject

Added Development branch

S3 bucket name used to store docekr images and terraform statefiles 

maris-test-s3-bucket

Infra:

* TF creates vpc, subnet, routing table, internet gateway, ec2 instance with init.sh as initial script.
* Actions creates on dispatch mode S3 for terraform state file and image repository.
