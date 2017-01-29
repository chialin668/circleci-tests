#!/bin/bash

function_name=$1

if [[ -z $function_name ]]; then
    echo "Please enter function name w/o .py!"
    exit 1
fi

echo "Checking if $function_name is on AWS...."
function_count=`aws lambda list-functions | grep FunctionName | grep $function_name | wc -l`
if [[ $function_count -eq 1 ]]; then
    echo "Deleting $function_name from AWS..."
    aws lambda delete-function --function-name $function_name
    if [[ $? != 0 ]];  then
        echo "Error deleting function $function_name"
        exit 1
    fi
else
    echo "Function $function_name not on AWS."
fi

echo "Generating zip file..."
rm -f upload.zip
zip upload.zip ${function_name}.py

echo "Adding $function_name..."
aws lambda create-function \
        --region us-west-2 \
        --function-name $function_name \
        --zip-file fileb://upload.zip \
        --role arn:aws:iam::123275298972:role/lambda_basic_execution \
        --handler $function_name.lambda_handler \
        --runtime python2.7 \
        --profile default \
