---
layout: plugin
title: Serverless Plugin Subscription Filter
repo: tsub/serverless-plugin-subscription-filter
homepage: 'https://github.com/tsub/serverless-plugin-subscription-filter'
description: 'A serverless plugin to register AWS CloudWatchLogs subscription filter'
stars: 17
stars_trend: 
stars_diff: 0
forks: 2
forks_trend: 
forks_diff: 0
watchers: 17
issues: 0
issues_trend: 
issues_diff: 0
---


# serverless-plugin-subscription-filter

[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com) [![npm version](https://badge.fury.io/js/serverless-plugin-subscription-filter.svg)](https://badge.fury.io/js/serverless-plugin-subscription-filter)

Serverless plugin to register AWS CloudWatchLogs subscription filter.

## Installation

`npm install --save-dev serverless-plugin-subscription-filter`

```yaml
plugins:
  - serverless-plugin-subscription-filter
```

## Usage

This plugin is external serverless events.
You can write settings like serverless events.

```yaml
functions:
  hello:
    handler: handler.hello
    events:
      - subscriptionFilter:
          stage: prod
          logGroupName: /cloud-trail
          filterPattern: '{ $.errorMessage != "" }'
```

Supports also multiple subscription filter.

```yaml
functions:
  hello:
    handler: handler.hello
    events:
      - subscriptionFilter:
          stage: prod
          logGroupName: /cloud-trail
          filterPattern: '{ $.errorMessage != "" }'
      - subscriptionFilter:
          stage: prod
          logGroupName: /my-log-group
          filterPattern: '{ $.errorMessage != "" }'
  goodbye:
    handler: handler.goodbye
    events:
      - subscriptionFilter:
          stage: dev
          logGroupName: /my-log-group2
          filterPattern: Exception
```

### About each properties

|property|description|
|:---:|:---:|
|stage|The deployment stage with serverless. Because only one subscription filter can be set for one LogGroup.|
|logGroupName|The log group to associate with the subscription filter. |
|filterPattern|The filtering expressions that restrict what gets delivered to the destination AWS resource. Sorry, if you want to use '{ $.xxx = "yyy" }' syntax, then surround the whole in ''(single quote).|

## Future supports

* Set IAM Role for subscription filter
