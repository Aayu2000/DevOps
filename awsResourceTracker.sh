#!/bin/bash

###############################
# Author: Aayush
# Date: 14/05/2024
# Version: V1
# This script will report the AWS resource usage
#
###############################
#set -x
#set -e
#set -o

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users
#
# list s3 buckets
echo "Available s3 buckets"
aws s3 ls

# list EC2 instances
echo "List of EC2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' > resourceTracker.txt

# list Lambda functions
echo "List of Lambda functions"
aws lambda list-functions

# list IAM Users
echo "List all IAM users"
aws iam list-users


