---
layout: plugin
title: Serverless Tag Api Gateway
repo: gfragoso/serverless-tag-api-gateway
homepage: 'https://github.com/gfragoso/serverless-tag-api-gateway'
description: 'Serverless plugin to tag API Gateway'
stars: 2
stars_trend: 
stars_diff: 0
forks: 1
forks_trend: 
forks_diff: 0
watchers: 2
issues: 1
issues_trend: 
issues_diff: 0
---


# serverless-tag-api-gateway
Serverless plugin to tag API Gateway

## Installation

Install the plugin via <a href="https://docs.npmjs.com/cli/install">NPM</a>

```
npm install --save-dev serverless-tag-api-gateway
```

## Usage

In Serverless template:

```
custom:
  apiGatewayTags:
    TagName1: TagValue1
    TagName2: TagValue2

plugins: 
  - serverless-tag-api-gateway

```
