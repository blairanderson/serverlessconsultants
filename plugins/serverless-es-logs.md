---
layout: plugin
title: Serverless Es Logs
repo: daniel-cottone/serverless-es-logs
homepage: 'https://github.com/daniel-cottone/serverless-es-logs'
description: 'A Serverless plugin to transport logs to ElasticSearch'
stars: 6
stars_trend: 
stars_diff: 0
forks: 1
forks_trend: 
forks_diff: 0
watchers: 6
issues: 0
issues_trend: 
issues_diff: 0
---


# serverless-es-logs

[![serverless][sls-image]][sls-url]
[![npm package][npm-image]][npm-url]
[![Build status][travis-image]][travis-url]
[![Coverage status][coveralls-image]][coveralls-url]
[![Known Vulnerabilities][snyk-image]][snyk-url]
[![Renovate][renovate-image]][renovate-url]

A [Serverless][sls-url] plugin for transporting Cloudwatch log groups within your CloudFormation stack into Elasticsearch.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)

## Installation

Install the plugin in your project:
```bash
$ yarn add serverless-es-logs --dev
$ npm install serverless-es-logs --save-dev
```

Add the plugin to your `serverless.yml`:
```yaml
plugins:
  - serverless-es-logs
```

## Usage

Define your configuration using the `custom` configuration option in `serverless.yml`:
```yaml
custom:
  esLogs:
    endpoint: some-elasticsearch-endpoint.us-east-1.es.amazonaws.com
    index: some-index
```

Your logs will now be transported to the specified elasticsearch instance using the provided index.

### Options

#### endpoint

(Required) The endpoint of the Elasticsearch instance the logs should be transported to.

```yaml
custom:
  esLogs:
    endpoint: some-elasticsearch-endpoint.us-east-1.es.amazonaws.com
```

#### includeApiGWLogs

(Optional) An option to be used in conjunction with the [serverless-aws-alias](https://github.com/HyperBrain/serverless-aws-alias) plugin. This will capture logs created by API Gateway and transport them to Elasticsearch.

```yaml
custom:
  esLogs:
    includeApiGWLogs: true
```

#### index

(Required) The Elasticsearch index that should be applied to the logs.

```yaml
custom:
  esLogs:
    index: some-index
```

#### retentionInDays

(Optional) The number of days that Cloudwatch logs should persist. Default is to never expire.

```yaml
custom:
  esLogs:
    retentionInDays: 7
```

[sls-image]:http://public.serverless.com/badges/v3.svg
[sls-url]:http://www.serverless.com
[npm-image]:https://img.shields.io/npm/v/serverless-es-logs.svg
[npm-url]:https://www.npmjs.com/package/serverless-es-logs
[travis-image]:https://travis-ci.org/daniel-cottone/serverless-es-logs.svg?branch=master
[travis-url]:https://travis-ci.org/daniel-cottone/serverless-es-logs
[coveralls-image]:https://coveralls.io/repos/github/daniel-cottone/serverless-es-logs/badge.svg?branch=master
[coveralls-url]:https://coveralls.io/github/daniel-cottone/serverless-es-logs?branch=master
[snyk-image]:https://snyk.io/test/github/daniel-cottone/serverless-es-logs/badge.svg
[snyk-url]:https://snyk.io/test/github/daniel-cottone/serverless-es-logs
[renovate-image]:https://img.shields.io/badge/renovate-enabled-brightgreen.svg
[renovate-url]:https://renovatebot.com/
