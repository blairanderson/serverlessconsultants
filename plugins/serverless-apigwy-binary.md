---
layout: plugin
title: Serverless Apigwy Binary
repo: ryanmurakami/serverless-apigwy-binary
homepage: 'https://github.com/ryanmurakami/serverless-apigwy-binary'
description: Serverless plugin for configuring API Gateway to return binary responses
stars: 11
stars_trend: up
stars_diff: 2
forks: 2
forks_trend: 
forks_diff: 0
watchers: 11
issues: 1
issues_trend: up
issues_diff: 1
---


# serverless-apigwy-binary

[Serverless framework](https://www.serverless.com) plugin to configure Binary responses in API Gateway

Original code from [codebox](https://github.com/craftship/codebox-npm/blob/master/.serverless_plugins/content-handling/index.js)

## Installation

Install to your Serverless project via npm

```bash
$ npm install --save serverless-apigwy-binary
```

## Usage

Add the plugin to your `serverless.yml`

```yaml
# serverless.yml

plugins:
  - serverless-apigwy-binary
```

Add the property `contentHandling: CONVERT_TO_BINARY` to an HTTP event

```yaml
# serverless.yml

functions:
  hello:
    handler: handler.hello
    events:
      - http:
          integration: lambda
          path: hello
          method: get
          contentHandling: CONVERT_TO_BINARY
```
