---
layout: plugin
title: Serverless Plugin Log Retention
repo: ArtificerEntertainment/serverless-plugin-log-retention
homepage: 'https://github.com/ArtificerEntertainment/serverless-plugin-log-retention'
description: 'Control the retention of your serverless function&#39;s cloudwatch logs.'
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


# serverless-plugin-log-retention
Control the retention of your serverless function's cloudwatch logs.

## Usage example
`serverless.yml`

```yml
service: sample

plugins:
  - serverless-plugin-log-retention

provider:
  name: aws

custom:
  logRetentionInDays: 30 # used to set a global value for all functions

functions:
  function1:
  function2:
    logRetentionInDays: 10 # set the retention for specific log group
```
