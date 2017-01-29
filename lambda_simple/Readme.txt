-- Install the required python package
    pip install pytest python-lambda-local

-- Test run
    python-lambda-local -f lambda_handler -t 5 simple.py event.json

-- Run through CircleCi
    git push origin master

-- Add AWS account number to CircleCI
    Click the project, Click Settings --> Click Environment Variables
    --> Set AWS_ACCOUNT environment variable

-- Set AWS Permissions
    Access Key
    Secret Access Key

