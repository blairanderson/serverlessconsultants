---
layout: plugin
title: Serverless Associate Waf
repo: mikesouza/serverless-associate-waf
homepage: 'https://github.com/mikesouza/serverless-associate-waf'
description: 'Associate a regional WAF with the AWS API Gateway used by your Serverless stack'
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


# serverless-associate-waf

[![Build Status](https://travis-ci.org/MikeSouza/serverless-associate-waf.svg?branch=master)](https://travis-ci.org/MikeSouza/serverless-associate-waf)
[![Coverage Status](https://coveralls.io/repos/github/MikeSouza/serverless-associate-waf/badge.svg?branch=master)](https://coveralls.io/github/MikeSouza/serverless-associate-waf?branch=master)

Associate a regional WAF with the AWS API Gateway used by your Serverless stack.

## Install

`npm install serverless-associate-waf --save-dev`

## Configuration

Add the plugin to your `serverless.yml`:

```yaml
plugins:
  - serverless-associate-waf
```

Add your custom configuration:

```yaml
custom:
  associateWaf:
    name: myRegionalWaf
```

| Property | Required | Type     | Default | Description                                                    |
|----------|----------|----------|---------|----------------------------------------------------------------|
| `name`   |  `true`  | `string` |         | The name of the regional WAF to associate the API Gateway with |

## Usage

Configuration of your `serverless.yml` is all you need.

There are no custom commands, just run: `sls deploy`
