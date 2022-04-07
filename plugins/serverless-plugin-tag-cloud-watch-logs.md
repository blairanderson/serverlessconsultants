---
layout: plugin
title: Serverless Plugin Tag Cloud Watch Logs
repo: pretty-fun-therapy/serverless-plugin-tag-cloud-watch-logs
homepage: 'https://github.com/pretty-fun-therapy/serverless-plugin-tag-cloud-watch-logs'
description: 'Small serverless plugin providing a way to add tags to CloudWatch resources'
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


# serverless-plugin-tag-cloud-watch-logs
Serverless plugin to tag CloudWatchLogs

## Installation
Install the plugin via <a href="https://docs.npmjs.com/cli/install">NPM</a>

```
npm install --save-dev @pretty-fun-therapy/serverless-plugin-tag-cloud-watch-logs
```

## Usage
In your serverless template :

```yaml
custom:
  cloudWatchLogsTags:
    TagName1: TagValue1
    TagName2: TagValue2

plugins:
  - '@pretty-fun-therapy/serverless-plugin-tag-cloud-watch-logs'
```

Or if you if you already have tags for your stack in another place :

```yaml
custom:
  cloudWatchLogsTags:${self:provider.<your_tags>}

plugins:
  - @pretty-fun-therapy/serverless-plugin-tag-cloud-watch-logs
```

This plugin also allow you to add tags retrieved from your lambda resources.  
To do so, you just have to add these lines into your serverless template :

```yaml
custom:
  addLambdaTagsOnLogGroups: true
  customTagsFromLambda:
    - "first_tag"
    - "second_tag"
    ...
```
