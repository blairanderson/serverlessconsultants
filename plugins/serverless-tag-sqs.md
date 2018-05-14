---
layout: plugin
title: Serverless Tag Sqs
repo: gfragoso/serverless-tag-sqs
homepage: 'https://github.com/gfragoso/serverless-tag-sqs'
description: 'Serverless plugin to tag SQS - Simple Queue Service'
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


# serverless-tag-sqs
Serverless plugin to tag SQS - Simple Queue Service

## Installation

Install the plugin via <a href="https://docs.npmjs.com/cli/install">NPM</a>

```
npm install --save-dev serverless-tag-sqs
```

## Usage

In Serverless template:

```
custom:
  sqsTags:
    TagName1: TagValue1
    TagName2: TagValue2

plugins: 
  - serverless-tag-sqs

```
