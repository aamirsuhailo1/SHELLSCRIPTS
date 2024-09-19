#! /bin/bash

##############################################################
# This script will list all active aws resources in aws account
# Author: Aamir Mohammed Suhail/ DevOps Team
# Version: v0.0.1
#
# Following are the supported AWS services by the script
# 1. EC2
# 2. S3
# 3. RDS
# 4. DynamoDB
# 5. Lambda
# 6. EBS
# 7. ELB
# 8. Cloudfront
# 9. CloudWatch
# 10. SNS
# 11. SQS
# 12. Route53
# 13. VPC
# 14. Cloud formation
# 15. IAM
#
# Usage: ./list_aws_resources.sh <region> <service_name>
# Example: ./list_aws_resources.sh us-east-1 EC2
##############################################################

# Check if number of arguments are passed
if [ $# -ne 2 ]; then 
    echo "Usage: $0 <region> <service_name>"
    exit 1
fi

# Check if aws cli is installed
if ! command -v aws &> /dev/null; then
    echo "AWS cli is not installed. please install and try!!!"
    exit 1
fi

# Check if aws cli is configured with aws access key
if [ ! -d ~/.aws ]; then
    echo "AWS cli is not configured. please configure and try!!!"
    exit 1
fi

# Execute AWS CLI command based on the service name provided by user
case $2 in
    EC2)
        aws ec2 describe-instances --region $1
        ;;
    S3)
        aws s3api list-buckets --region $1
        ;;
esac
