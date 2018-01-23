---
layout: plugin
title: Serverless S3 Encryption
repo: tradle/serverless-s3-encryption
homepage: 'https://github.com/tradle/serverless-s3-encryption'
description: 'Set or remove the encryption settings on your s3 buckets'
stars: 3
stars_trend: 
stars_diff: 0
forks: 0
forks_trend: 
forks_diff: 0
watchers: 3
issues: 0
issues_trend: 
issues_diff: 0
---


# serverless-s3-encryption

set or remove the encryption settings on the s3 buckets in your serverless stack

This plugin runs on the `after:deploy` hook, but you can also run it manually with: `sls s3-encryption update`

## Install

`npm install --save-dev serverless-s3-encryption`

## Usage

See the example below for how to modify your `serverless.yml`

```yaml
# serverless.yml

plugins:
  # ...
  - serverless-s3-encryption

custom:
  # ...
  s3-encryption:
    buckets:
      MyEncryptedBucket:
        # see: http://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/S3.html#putBucketEncryption-property
        # accepted values: none, AES256, aws:kms
        SSEAlgorithm: AES256
        # only if SSEAlgorithm is aws:kms
        KMSMasterKeyID: STRING_VALUE 

resources:
  Resources:
    MyEncryptedBucket:
      Type: "AWS::S3::Bucket"
      Description: my encrypted bucket
      DeletionPolicy: Retain
```
