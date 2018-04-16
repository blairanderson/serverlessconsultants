---
layout: plugin
title: Serverless Plugin Stage Variables
repo: svdgraaf/serverless-plugin-stage-variables
homepage: 'https://github.com/svdgraaf/serverless-plugin-stage-variables'
description: 'Add stage variables for Serverless 1.x to ApiGateway, so you can use variables in your Lambda&#39;s'
stars: 21
stars_trend: 
stars_diff: 0
forks: 14
forks_trend: up
forks_diff: 1
watchers: 21
issues: 0
issues_trend: 
issues_diff: 0
---


# serverless-plugin-stage-variables
Add stage variables for Serverless 1.x to ApiGateway, so you can use variables (and CloudFormation references!) in your Lambda's.


# Usage
```yaml

custom:
  stageVariables:
    bucket_name: ${env.BUCKET_NAME}
    endpoint: { "Fn::GetAtt": "CloudFrontEndpoint.DomainName" }
    foo: bar

plugins:
  - serverless-plugin-stage-variables
```

And then in your lambda's, you can use:

```javascript
module.exports.foobar = (event, context, cb) => {
  // event.stageVariables.bucket_name
  // event.stageVariables.endpoint
  // event.stageVariables.foo
}
```
