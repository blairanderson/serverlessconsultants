---
layout: plugin
title: Serverless Apigateway Service Proxy
repo: horike37/serverless-apigateway-service-proxy
homepage: 'https://github.com/horike37/serverless-apigateway-service-proxy'
description: 'This Serverless Framewrok plugin supports the AWS service proxy integration feature of API Gateway.'
stars: 26
stars_trend: 
stars_diff: 0
forks: 2
forks_trend: 
forks_diff: 0
watchers: 26
issues: 0
issues_trend: 
issues_diff: 0
---


![serverless](http://public.serverless.com/badges/v3.svg)

# Serverless APIGateway Service Proxy(BETA)
This Serverless Framewrok plugin supports the AWS service proxy integration feature of API Gateway. You can directly connect API Gateway to AWS services without Lambda.

## Install
Run `servelress plugin install` in your Serverless project.

```
$ serverless plugin install -n serverless-apigateway-service-proxy
```

## Supported AWS services
Here is a services list which this plugin supports for now. But will expand to other services in the feature.
Please pull request if you are intersted in it.

- Kinesis Streams
- SQS

## How to use
Define settings of the AWS services you want to integrate under `custom > apiGatewayServiceProxies` and run `serverless deploy`.

### Kinesis
Sample syntax for Kinesis proxy in serverless.yml.
```yaml
custom:
  apiGatewayServiceProxies:
    - kinesis:
        path: /kinesis
        method: post
        streamName: { Ref: 'YourStream' }
        cors: true

resources:
  Resources:
    YourStream:
      Type: AWS::Kinesis::Stream
      Properties:
        ShardCount: 1
```

Sample request after deploying.
```
curl -XPOST https://xxxxxxx.execute-api.us-east-1.amazonaws.com/dev/kinesis -d '{"Data": "some data","PartitionKey": "some key"}'  -H 'Content-Type:application/json'
```

### SQS

Sample syntax for SQS proxy in serverless.yml.
```yaml
custom:
  apiGatewayServiceProxies:
    - sqs:
        path: /sqs
        method: post
        queueName: {"Fn::GetAtt":[ "SQSQueue", "QueueName" ]}
        cors: true

resources:
  Resources:
    SQSQueue:
      Type: "AWS::SQS::Queue"
```

Sample request after deploying.
```
curl -XPOST https://xxxxxx.execute-api.us-east-1.amazonaws.com/dev/sqs -d '{"message": "testtest"}' -H 'Content-Type:application/json'
```
