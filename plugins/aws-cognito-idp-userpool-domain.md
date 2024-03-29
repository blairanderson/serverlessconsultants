---
layout: plugin
title: Aws Cognito Idp Userpool Domain
repo: rubentrancoso/aws-cognito-idp-userpool-domain
homepage: 'https://github.com/rubentrancoso/aws-cognito-idp-userpool-domain'
description: 'Manage (add and remove) aws hosted domain on Cognito Userpools'
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


[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)
# aws-cognito-idp-userpool-domain

[![NPM](https://nodei.co/npm/aws-cognito-idp-userpool-domain.png?downloads=true&downloadRank=true&stars=true)](https://nodei.co/npm/aws-cognito-idp-userpool-domain/)

### description
With this plugin you will be able to manage a hosted aws domain to the Cognito Userpool with Serverless Framework.

You can find this and other plugins on [Severless Community Plugins](https://github.com/serverless/plugins) repository.

### installation
```bash
$ npm install aws-cognito-idp-userpool-domain
```

### npm package
<a href="https://www.npmjs.com/package/aws-cognito-idp-userpool-domain" target="_blank">https://www.npmjs.com/package/aws-cognito-idp-userpool-domain</a>

### Serverless.yml
```
service: myservice

plugins:
  - aws-cognito-idp-userpool-domain
custom:
  stage: ${opt:stage, self:provider.stage}  
  
provider:
  name: aws
  runtime: nodejs8.10
  profile: default
  region: us-east-1
```

### AWS::Cognito::UserPool resource
```
Resources:
  MyUserpool:
    Type: AWS::Cognito::UserPool
    Properties:
      AdminCreateUserConfig: 
        AllowAdminCreateUserOnly: true
        InviteMessageTemplate:
          EmailMessage: Your username is {username} and temporary password is {####}.  
          EmailSubject: Your temporary password
          SMSMessage: Your username is {username} and temporary password is {####}.
        UnusedAccountValidityDays: 7
      UsernameAttributes: 
        - email
      AutoVerifiedAttributes: 
        - email
      EmailConfiguration: 
        ReplyToEmailAddress: donotreply@domain.tld
      EmailVerificationMessage: Your verification code is {####}.
      EmailVerificationSubject: Your verification code
      MfaConfiguration: OFF
      Policies:
        PasswordPolicy:
          MinimumLength: 8
          RequireLowercase: true
          RequireNumbers: true
          RequireSymbols: false
          RequireUppercase: true
      UserPoolName: ${self:service}-${self:custom.stage}
  MyCognitoUserPoolClient:
    Type: AWS::Cognito::UserPoolClient
    Properties:
      ClientName: ${self:service}-${self:custom.stage}-user-pool-client
      UserPoolId:
        Ref: MyUserpool
      GenerateSecret: true
```
 
 # Deploy Output
 ### # serverless deploy -v -s dev
 
 ```
 Serverless: Packaging service...
Serverless: Creating Stack...
Serverless: Checking Stack create progress...
CloudFormation - CREATE_IN_PROGRESS - AWS::CloudFormation::Stack - myservice-dev
CloudFormation - CREATE_IN_PROGRESS - AWS::S3::Bucket - ServerlessDeploymentBucket
CloudFormation - CREATE_IN_PROGRESS - AWS::S3::Bucket - ServerlessDeploymentBucket
CloudFormation - CREATE_COMPLETE - AWS::S3::Bucket - ServerlessDeploymentBucket
CloudFormation - CREATE_COMPLETE - AWS::CloudFormation::Stack - myservice-dev
Serverless: Stack create finished...
Serverless: Uploading CloudFormation file to S3...
Serverless: Uploading artifacts...
Serverless: Validating template...
Serverless: Updating Stack...
Serverless: Checking Stack update progress...
CloudFormation - UPDATE_IN_PROGRESS - AWS::CloudFormation::Stack - myservice-dev
CloudFormation - CREATE_IN_PROGRESS - AWS::Cognito::UserPool - MyUserpool
CloudFormation - CREATE_IN_PROGRESS - AWS::Cognito::UserPool - MyUserpool
CloudFormation - CREATE_COMPLETE - AWS::Cognito::UserPool - MyUserpool
CloudFormation - CREATE_IN_PROGRESS - AWS::Cognito::UserPoolClient - MyCognitoUserPoolClient
CloudFormation - CREATE_IN_PROGRESS - AWS::Cognito::UserPoolClient - MyCognitoUserPoolClient
CloudFormation - CREATE_COMPLETE - AWS::Cognito::UserPoolClient - MyCognitoUserPoolClient
CloudFormation - UPDATE_COMPLETE_CLEANUP_IN_PROGRESS - AWS::CloudFormation::Stack - myservice-dev
CloudFormation - UPDATE_COMPLETE - AWS::CloudFormation::Stack - myservice-dev
Serverless: Stack update finished...
Service Information
service: myservice
stage: dev
region: us-east-1
stack: myservice-dev
api keys:
  None
endpoints:
  None
functions:
  None

Stack Outputs
UserPoolIdMyUserpool: us-east-1_Ea2rfHMLF
ServerlessDeploymentBucketName: myservice-dev-serverlessdeploymentbucket-a34u7pvypfh

Plugin [aws-cognito-idp-userpool-domain]: process_deploy started.
Plugin [aws-cognito-idp-userpool-domain]: Creating user pool domain...
Plugin [aws-cognito-idp-userpool-domain]: userpoolid: [us-east-1_Ea2rfHMLF], domainname: [myservice-dev]
Plugin [aws-cognito-idp-userpool-domain]: domain created
Plugin [aws-cognito-idp-userpool-domain]: done.
Plugin [aws-cognito-idp-userpool-domain]: process_deploy finished.
```

# Remove Output
### # serverless remove

```
Plugin [aws-cognito-idp-userpool-domain]: process_remove started.
Plugin [aws-cognito-idp-userpool-domain]: Deleting user pool domain...
Plugin [aws-cognito-idp-userpool-domain]: userpoolid: [us-east-1_Ea2rfHMLF], domainname: [myservice-dev]
Plugin [aws-cognito-idp-userpool-domain]: domain deleted
Plugin [aws-cognito-idp-userpool-domain]: done.
Plugin [aws-cognito-idp-userpool-domain]: process_remove finished.
Serverless: Getting all objects in S3 bucket...
Serverless: Removing objects in S3 bucket...
Serverless: Removing Stack...
Serverless: Checking Stack removal progress...
.......
Serverless: Stack removal finished...
```
