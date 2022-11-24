#!/usr/bin/env bash

# Read input variables
COMPONENT=$1
STATUS=$2

echo $STATUS

# Default message
MESSAGE=""$COMPONENT" failed :no_entry:"
if [ $STATUS = 0 ]; then
    MESSAGE=""$COMPONENT" passed :white_check_mark:"
fi

# Send notification
curl -X POST \
  https://discord.com/api/webhooks/1045437333350129754/1jJsbYwUo91uLJxz1qHbKvcuI1CvCOKeku9AYME-fY62XBzP7AMD7QKmz2ud9Y7ZqVFq \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d '{
	"content":"'"$MESSAGE"'"
}'
