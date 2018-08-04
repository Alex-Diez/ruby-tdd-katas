#!/bin/bash

aws sns publish --topic arn:aws:sns:us-east-1:541858354261:queues-Topic-LY93DTIGPHXR --message 'hello from aws' --region us-east-1
