---
layout: plugin
title: Serverless Tag Sns Topic
repo: inokappa/serverless-tag-sns-topic
homepage: 'https://github.com/inokappa/serverless-tag-sns-topic'
description: 'Serverless plugin to tag SNS Topic'
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


# serverless-tag-sns-topic

Serverless plugin to tag SNS Topic (referred to https://github.com/gfragoso/serverless-tag-sqs :tada:)

## Installation

Install the plugin via <a href="https://github.com/inokappa/serverless-tag-sns-topic">Github</a>.

```
npm install --save-dev github:inokappa/serverless-tag-sns-topic
```

## Usage

In Serverless template:

```
custom:
  snsTopicTags:
      -
        Key: 'key1'
        Value: 'value1'
      -
        Key: 'key2'
        Value: 'value2'


plugins: 
  - serverless-tag-sns-topic

```
