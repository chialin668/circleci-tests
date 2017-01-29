import boto3

def lambda_handler(event, context):

    print "Test dynamodb...."
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('users')
    response = table.get_item(
        Key={
            'username': 'foobar',
            'last_name': 'Doe'
        }
    )
    item = response['Item']
    print(item)    

    return 'foobar'

