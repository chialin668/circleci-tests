def lambda_handler(event, context):
    print "Last: %s" % event['last_name']
    print "First: %s" % event['first_name']
    return 'foobar'
