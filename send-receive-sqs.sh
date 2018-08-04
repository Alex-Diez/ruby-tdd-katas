#!/bin/bash

aws sqs send-message --queue-url https://sqs.us-east-1.amazonaws.com/541858354261/queues-MessageQueue-ZBIZXEUU5YW1 --message-body 'hello sqs' --region us-east-1

aws sqs receive-message --queue-url https://sqs.us-east-1.amazonaws.com/541858354261/queues-MessageQueue-ZBIZXEUU5YW1 --region us-east-1
