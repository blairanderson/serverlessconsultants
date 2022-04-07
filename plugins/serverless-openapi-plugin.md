---
layout: plugin
title: Serverless Openapi Plugin
repo: jaumard/serverless-openapi-plugin
homepage: 'https://github.com/jaumard/serverless-openapi-plugin'
description: 'Serverless plugin to generate serverless API architecture from OpenAPI definition.'
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


# serverless-openapi-plugin

Serverless plugin to generate AWS serverless architecture from openApi definition.

It also generate validation (using Joi) for headers/query/params and body.

## Configuration
On your `serverless.yml` add:

```
plugins: 
 -serverless-openapi-plugin
``` 

By default the plugin is looking for a `definition.yml`, but you can override this setting using:
```
customs: 
 definition: mydefinition.yml
``` 

In order to generate handlers, you need to specify the handler name at root or operation level with `x-serverless-handler` key.

## Usage
Simple as:
```
serverless openapi
```
