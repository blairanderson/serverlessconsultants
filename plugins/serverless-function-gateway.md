---
layout: plugin
title: Serverless Function Gateway
repo: KennethWussmann/serverless-function-gateway
homepage: 'https://github.com/KennethWussmann/serverless-function-gateway'
description: 'Publish AWS Lambda functions to selfhosted [function-gateway](https://github.com/KennethWussmann/function-gateway).'
stars: 0
stars_trend: 
stars_diff: 0
forks: 0
forks_trend: 
forks_diff: 0
watchers: 0
issues: 0
issues_trend: 
issues_diff: 0
---


# serverless-function-gateway 
[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)

Plugin for the [serverless framework](https://github.com/serverless/serverless) that pushes your AWS Lambda functions to
your selfhosted [function-gateway](https://github.com/KennethWussmann/function-gateway).

## Installation
```
sls plugin install --name serverless-function-gateway 
```

## Usage

```YAML
service: test
provider:
  name: aws
  runtime: java8
  region: eu-central-1

custom:
  # New settings of this plugin:
  function-gateway:
    # Where is your function-gateway reachable (make sure to have Webhook resolver enabled)
    endpoint: "https://api.example.com/webhook"
    # Optional secret, if enabled in function-gateway
    #secret: "123456"
    # Optional stage used for all functions (if not set, serverless' stage will be used)
    #stage: dev

plugins:
  # Declare this plugin as installed (should be added by default by running above command)
  - serverless-function-gateway

functions:
  testEndpoint:
    handler: com.example.lambda.TestEndpoint
    events:
    # New event type of this plugin:
    - route:
        # What path should invoke this function?
        path: /example
        # What http method should be used to invoke?
        method: GET
        # Optional stage of this single function (if not set, custom.function-gateway.stage will be used)
        #stage: dev
```

