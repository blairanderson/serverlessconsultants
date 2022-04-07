---
layout: plugin
title: Serverless Log Metric Filter
repo: saqemlas/serverless-log-metric-filter
homepage: 'https://github.com/saqemlas/serverless-log-metric-filter'
description: 'Add Cloudwatch Log Metric Filter to Cloudwatch Logs'
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


# Serverless-Log-Metric-Filter

[![npm package][npm-img]][npm-url]
[![Build Status][build-img]][build-url]
[![Downloads][downloads-img]][downloads-url]
[![Issues][issues-img]][issues-url]
[![Semantic Release][semantic-release-img]][semantic-release-url]

[build-img]:https://github.com/saqemlas/serverless-log-metric-filter/actions/workflows/release.yml/badge.svg?branch=main
[build-url]:https://github.com/saqemlas/serverless-log-metric-filter/actions/workflows/release.yml
[downloads-img]:https://img.shields.io/npm/dt/serverless-log-metric-filter
[downloads-url]:https://www.npmtrends.com/serverless-log-metric-filter
[npm-img]:https://img.shields.io/npm/v/serverless-log-metric-filter
[npm-url]:https://www.npmjs.com/package/serverless-log-metric-filter
[issues-img]:https://img.shields.io/github/issues/saqemlas/serverless-log-metric-filter
[issues-url]:https://github.com/saqemlas/serverless-log-metric-filter/issues
[semantic-release-img]:https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
[semantic-release-url]:https://github.com/semantic-release/semantic-release


## Installation

- with NPM
```bash
npm install --save-dev serverless-log-metric-filter
```

- with Yarn
```bash
yarn add --dev serverless-log-metric-filter
```

- Then update `serverless.yml` file
```yml
plugins:
  - serverless-log-metric-filter
```

- Alternatively, install with the Serverless plugin command (Serverless Framework 1.22 or higher):
```bash
sls plugin install -n serverless-log-metric-filter
```

## Usage

- To use fallback values, in your `serverless.yml` file
```yml
custom:
  logMetricFilter:
    enabled: true
```

- To add custom values, in your `serverless.yml` file
```yml
custom:
  logMetricFilter:
    enabled: true
    filterPattern: Task timed out after
    metricName: TimeOut
    metricNameSpace: Lambda
    metricValue: 1
```

- To disable for specific functions, in your `serverless.yml` file
```yml
functions:
  exampleFunction:
    logMetricFilter: false
```

## License

Copyright (c) 2021 [Salem Qemlas](https://saqemlas.io). See the included [LICENSE](LICENSE.md) for rights and limitations under the terms of the MIT license.
