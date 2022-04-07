---
layout: plugin
title: Serverless Disable Functions
repo: abeMedia/serverless-disable-functions
homepage: 'https://github.com/abeMedia/serverless-disable-functions'
description: 'A simple serverless plugin to disable functions.'
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


# serverless-disable-functions

A simple serverless plugin to disable functions.

## Install

```sh
yarn add --dev serverless-disable-functions
```

or

```sh
npm install --save-dev serverless-disable-functions
```

Add the plugin to your serverless.yml file:

```yaml
plugins:
  - serverless-disable-functions
```

## Usage

Add the parameter `enabled: false` to a function to disable it.
This allows you to enable/disable functions by stage like so:

```yaml
service: hello-service
provider: aws
custom:
  hello_enabled:
    dev: true
    prod: false

functions:
  hello:
    handler: handler.hello
    enabled: ${self:custom.hello_enabled.${opt:stage}}
```
