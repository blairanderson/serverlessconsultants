---
layout: plugin
title: Api Gateway Stage Tag Plugin
repo: mikepatrick/api-gateway-stage-tag-plugin
homepage: 'https://github.com/mikepatrick/api-gateway-stage-tag-plugin'
description: 'A shim to tag API Gateway stages until CloudFormation/Serverless support arrives.'
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


A shim to tag API Gateway stages until CloudFormation/Serverless support arrives.

Usage
======

In Serverless template:

```
plugins: 
  - api-gateway-stage-tag-plugin

custom:
  apiStageTags:
    TagName1: TagValue1
    TagName2: TagValue2
```
