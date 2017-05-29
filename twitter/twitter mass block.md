#!/usr/bin/env python
#Python3.4.3 compatable
#All the credit for this goes to the original author 00101010b.
#I just added a for loop and list of possible account names.

# Import TwitterAPI
# you can install this library via the commandline:
# $ pip install --user TwitterAPI
from TwitterAPI import TwitterAPI

# setup TwitterAPI
# you will have to get an API key set from: https://apps.twitter.com/ before you can use this script.
api = TwitterAPI( \
        consumer_key='XXXXX', \
        consumer_secret='XXXXX', \
        access_token_key='XXXXX', \
        access_token_secret='XXXXX' \
        )

# get a list of already blocked users.
blockedUsers = list(set(user['screen_name'] for user in api.request('blocks/list', {'include_entities': 'false', 'skip_status':'true'})))

#list of possible varioations on account names
iph_derp = ("....","...",")

for user in list(iph_derp):
	# check if our current user is already in our block list
	# if they are let us know about it.
	if user in blockedUsers:
		print ("User '%s' already blocked." % user)
		continue
	# if they aren't, block them.
	else:
		blocked = api.request('blocks/create', {'screen_name': user})
	if blocked:
		print ("Blocked user: [ @%s ]." % user)
