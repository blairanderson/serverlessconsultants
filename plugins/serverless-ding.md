---
layout: plugin
title: Serverless Ding
repo: sidgonuts/serverless-ding
homepage: 'https://github.com/sidgonuts/serverless-ding'
description: 'Serverless plugin to audibly alert user after deployment'
stars: 1
stars_trend: 
stars_diff: 0
forks: 0
forks_trend: 
forks_diff: 0
watchers: 1
issues: 1
issues_trend: 
issues_diff: 0
---


# serverless-ding
A serverless plugin that outputs a [bell character](https://en.wikipedia.org/wiki/Bell_character) to Terminal after `sls deploy`. Will only work if the audible bell in Terminal is turned on.

# Why
Because running `sls deploy` takes just long enough to go do something else and forget that you ran `sls deploy`. Figured a notification would be nice.

# Getting Started

## Prerequisites
Make sure you have the following installed before starting:
* [nodejs](https://nodejs.org/en/download/)
* [npm](https://www.npmjs.com/get-npm?utm_source=house&utm_medium=homepage&utm_campaign=free%20orgs&utm_term=Install%20npm)
* [serverless](https://serverless.com/framework/docs/providers/aws/guide/installation/)


## Installing

### From npm (recommended)
```
npm install serverless-ding --save-dev
```

Then make the following edits to your serverless.yaml file:

Add the plugin.

```yaml
plugins:
  - serverless-ding
```
