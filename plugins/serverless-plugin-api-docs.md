---
layout: plugin
title: Serverless Plugin Api Docs
repo: 8select/serverless-plugin-api-docs
homepage: 'https://github.com/8select/serverless-plugin-api-docs'
description: Serverless plugin to automatically create a lambda function which returns Swagger-UI HTML API Documentation Page based on the given swagger spec JSON file.
stars: 3
stars_trend: 
stars_diff: 0
forks: 0
forks_trend: 
forks_diff: 0
watchers: 3
issues: 2
issues_trend: 
issues_diff: 0
---


# serverless-plugin-api-docs
[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)

Work with [SWAGGER](https://swagger.io/docs/specification) documentation for [Serverless v1.0](https://serverless.com/) projects.

A [serverless](http://www.serverless.com) plugin to **automatically** create a lambda function which returns the swagger-ui HTML based on the given swagger spec JSON file `GET /docs` => swagger-ui

## Install
using NPM

`npm install --save-dev 8select/serverless-plugin-api-docs`

Add the plugin to your `serverless.yml` file:

```yaml
plugins:
  - serverless-plugin-api-docs
```

## Prerequisites
[Download](https://swagger.io/swagger-ui/) and host swagger-ui library files e.g. with S3
  * swagger-ui.css
  * swagger-ui-bundle.js
  * swagger-ui-standalone-preset.js

## Configuration

```yaml
custom:
  documentation:
    path: 'path/to/swagger.json' # REQUIRED
    contentUrl: '<URL_TO_YOUR_HOSTED_SWAGGER_UI_FILES>' # REQUIRED
    name: '<your_custom_lambda_function_name>' # OPTIONAL - default = 'docs'
```
