---
layout: plugin
title: Serverless Plugin Resource Tagging
repo: ilayanambi86/serverless-plugin-resource-tagging
homepage: 'https://github.com/ilayanambi86/serverless-plugin-resource-tagging'
description: 'Plugin to support stackTags based AWS resource tagging and APIGateway tagging.'
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


# serverless-plugin-resource-tagging

Serverless stackTags will update the tags for all the resources that support tagging. But the issue is it will update once during create. If you update the tag values after deployment, it wont reflect in next deployment.
We have to remove the stack and redeploy to get the new tags reflect. This plugin will solve that issue for AWS.

#### Note: 
 - This plugin is only for AWS.
 - This plugin will support APIGateway stage tags even if stage is not configured in serverless.yml and clouformation created one. 

### Using this pluging
```
npm install serverless-plugin-resource-tagging
```

### serverless.yml
```
provider:
    name: XXX
    stackTags:
        Tag1: "Tag1 value"
        Tag2: "Tag2 value"
plugins:
  - serverless-plugin-resource-tagging
```
    
### Suported AWS resources
```
AWS::Lambda::Function
AWS::SQS::Queue
AWS::Kinesis::Stream
AWS::DynamoDB::Table
AWS::S3::Bucket
AWS::ApiGateway::Stage
AWS::CloudFront::Distribution
AWS::Logs::LogGroup
```
