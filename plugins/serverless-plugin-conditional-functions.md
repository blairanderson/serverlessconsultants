---
layout: plugin
title: Serverless Plugin Conditional Functions
repo: go-dima/serverless-plugin-conditional-functions
homepage: 'https://github.com/go-dima/serverless-plugin-conditional-functions'
description: 'A plugin that allows adding simple feature flag per function via a boolean condition.'
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


[![npm version](https://img.shields.io/npm/v/serverless-plugin-conditional-functions.svg?style=flat-square)](https://www.npmjs.com/package/serverless-plugin-conditional-functions)
[![Build Status](https://api.travis-ci.org/go-dima/serverless-plugin-conditional-functions.png)](https://travis-ci.org/go-dima/serverless-plugin-conditional-functions)
[![npm downloads](https://img.shields.io/npm/dm/serverless-plugin-conditional-functions.svg?style=flat-square)](https://www.npmjs.com/package/serverless-plugin-conditional-functions)

[![NPM](https://nodei.co/npm/serverless-plugin-conditional-functions.png)](https://nodei.co/npm/serverless-plugin-conditional-functions/)

# Serverless Plugin Conditional Functions
This plugin allows you to add a custom condition to each function in your ```serverless.yml```, to toggle the deployment of your functions.
Effectively, it allows a simple feature-flag per function.

For example, if you want to deploy a function for testing only, but don't want it in production, or vice-versa.
The attribute supports simple ```true/false``` usage or more complex (see below) conditions.

## Installation
```npm i serverless-plugin-conditional-functions --save-dev```

## Example
```
service: MyCustomService
provider:
  name: aws
  runtime: java8
  stage: ${opt:stage,'test'}
  region: ${opt:region,'us-east-1'}

plugins:
  - serverless-plugin-conditional-functions

functions:
  func1:
    enabled: '"${self:provider.stage}" == "prod"'
    handler: com.example.functions.Func1Handler
    events:
      - http:
          path: func1
          method: GET
          integration: lambda
  func2:
    enabled: '"${self:provider.stage}" != "prod"'
    handler: com.example.functions.Func2Handler
    events:
      - http:
          path: func2
          method: GET
          integration: lambda
  func3:
    enabled: 'false'
    handler: com.example.functions.Func3Handler
    events:
      - http:
          path: func3
          method: GET
          integration: lambda
```
