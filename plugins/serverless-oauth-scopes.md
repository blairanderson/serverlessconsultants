---
layout: plugin
title: Serverless Oauth Scopes
repo: birdcatcher/serverless-oauth-scopes
homepage: 'https://github.com/birdcatcher/serverless-oauth-scopes'
description: 'A serverless plugin to set OAuth Scopes on APIGateway methods'
stars: 2
stars_trend: 
stars_diff: 0
forks: 0
forks_trend: 
forks_diff: 0
watchers: 2
issues: 0
issues_trend: 
issues_diff: 0
---


# serverless-oauth-scopes
[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)

A [serverless](http://www.serverless.com) plugin to set OAuth Scopes on APIGateway methods.

## Install

`npm install --save-dev serverless-oauth-scopes`

Add the plugin to your `serverless.yml` file:

```yaml
plugins:
  - serverless-oauth-scopes
```

## Configuration
```yaml
http:
  scopes: [<array of scope string>]
```
