---
layout: plugin
title: Serverless Tag Cloud Watch Logs
repo: gfragoso/serverless-tag-cloud-watch-logs
homepage: 'https://github.com/gfragoso/serverless-tag-cloud-watch-logs'
description: 'Serverless plugin to tag CloudWatchLogs'
stars: 4
stars_trend: up
stars_diff: 1
forks: 1
forks_trend: 
forks_diff: 0
watchers: 4
issues: 0
issues_trend: 
issues_diff: 0
---


# serverless-tag-cloud-watch-logs
Serverless plugin to tag CloudWatchLogs

## Installation

Install the plugin via <a href="https://docs.npmjs.com/cli/install">NPM</a>

```
npm install --save-dev serverless-tag-cloud-watch-logs
```

## Usage

In Serverless template:

```
custom:
  cloudWatchLogsTags:
    TagName1: TagValue1
    TagName2: TagValue2

plugins: 
  - serverless-tag-cloud-watch-logs

```
