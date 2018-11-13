---
layout: plugin
title: Serverless Add Api Key
repo: rrahul963/serverless-add-api-key
homepage: 'https://github.com/rrahul963/serverless-add-api-key'
description: 'Serverless plugin to add same api key for multiple serverless services i.e. to re-use apikey across multiple api gateway apis.'
stars: 2
stars_trend: 
stars_diff: 0
forks: 6
forks_trend: 
forks_diff: 0
watchers: 2
issues: 0
issues_trend: 
issues_diff: 0
---


# serverless-add-api-key
[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)

A [serverless](http://www.serverless.com) plugin to create api key and usage pattern (if they don't already exist) and associate them to the Rest Api.
Serverless provides this functionality natively but it doesn't allow you to associate multiple services with same apiKey and usage plan.
This plugin associates your Serverless service with same api key if the key already exists. Also works with multiple keys.

## Install

`npm install --save-dev serverless-add-api-key`

Add the plugin to your `serverless.yml` file:

```yaml
plugins:
  - serverless-add-api-key
```

## Configuration
```yaml
custom:
  apiKeys: [<api key name>]
```
Code automatically creates a usage plan called `<api-key-name>-usage-plan`.

