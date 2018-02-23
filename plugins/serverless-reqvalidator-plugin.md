---
layout: plugin
title: Serverless Reqvalidator Plugin
repo: RafPe/serverless-reqvalidator-plugin
homepage: 'https://github.com/RafPe/serverless-reqvalidator-plugin'
description: 'Serverless plugin to add request validator to API Gateway methods'
stars: 10
stars_trend: 
stars_diff: 0
forks: 0
forks_trend: 
forks_diff: 0
watchers: 10
issues: 0
issues_trend: 
issues_diff: 0
---


# serverless-reqvalidator-plugin
Serverless plugin to set specific validator request on method

## Installation 
```
npm install serverless-reqvalidator-plugin
```

## Requirements
This require you to have documentation plugin installed
```
serverless-aws-documentation
```


## Using plugin
Specify plugin 
```
plugins:
  - serverless-reqvalidator-plugin
  - serverless-aws-documentation
```


In `serverless.yml` create custom resource for request validators 

```
    xMyRequestValidator:  
      Type: "AWS::ApiGateway::RequestValidator"
      Properties:
        Name: 'my-req-validator'
        RestApiId: 
          Ref: ApiGatewayRestApi
        ValidateRequestBody: true
        ValidateRequestParameters: false  
```

For every function you wish to use the validator set property `reqValidatorName: 'xMyRequestValidator'` to match resource you described 

```
  debug:
    handler: apis/admin/debug/debug.debug
    timeout: 10
    events:
      - http:
          path: admin/debug
          method: get
          cors: true
          private: true 
          reqValidatorName: 'xMyRequestValidator'
```


