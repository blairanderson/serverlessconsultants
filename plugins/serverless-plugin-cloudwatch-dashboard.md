---
layout: plugin
title: Serverless Plugin Cloudwatch Dashboard
repo: codecentric/serverless-plugin-cloudwatch-dashboard
homepage: 'https://github.com/codecentric/serverless-plugin-cloudwatch-dashboard'
description: 'Serverless plugin to generate AWS CloudWatch dashboard for AWS Lambda functions'
stars: 3
stars_trend: 
stars_diff: 0
forks: 0
forks_trend: 
forks_diff: 0
watchers: 3
issues: 0
issues_trend: 
issues_diff: 0
---


Serverless CloudWatch Dashboards Plugin
=============================
[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.png)](https://raw.githubusercontent.com/codecentric/serverless-plugin-cloudwatch-dashboard/master/LICENSE)

Serverless plugin to generate AWS CloudWatch dashboard for deployed lambdas

**Requirements:**
* Serverless *v1.12.x* or higher
* AWS provider

## Setup


### Installation

Install via npm in the root of your Serverless service:

```sh
npm install serverless-plugin-cloudwatch-dashboard
```

Add the plugin to the `plugins` array of your Serverless service in `serverless.yml`:

```yml
plugins:
  - serverless-plugin-cloudwatch-dashboard
```

### Configuration

The plugin can be configured by adding a property called `dashboard` to the custom properties of the Serverless
service. Following dashboards are currently supported:
- [Lambda Dashboards](#lambda-dashboards)
- [DynamoDB Dashboards](#dynamoDB-dashboards)

#### Lambda Dashboards

The configuration can specify the lambda `metrics` together with the `stats` of the metrics to 
be added. The plugin will then generate one dashboard for each metric, with each dashboard containing the 
specified statistics for each lambda function.

Lambda dashboards can be globally activated/deactivated for all functions by adding an `enabled` flag to the configuration.

This is the minimum required configuration:
```yaml
dashboard:
  lambda:
    enabled: true
```

The default configuration looks like this:
```yaml
dashboard:
  lambda:
    metrics: [ Duration, Errors, Invocations, Throttles ]
    stats: [p99, p95, p90, p50]
    enabled: true
```

To gain maximum control over which functions to be included, you can disable lambda dashboards globally,
```yaml
dashboard:
  lambda:
    enabled: false
```
and enable it only for specific functions, by setting the `dashboard` flag for those functions to `true`:
```yaml
functions:
    myFunction:
      handler: some_handler
      dashboard: true
```
#### DynamoDB Dashboards

The configuration can specify the `metrics` for DynamoDB Tables and GlobalSecondaryIndexes to be added. The plugin will 
then generate a new dashboard containing one widget for each metric.

DynamoDB dashboards can be globally activated/deactivated for all tables by adding an `enabled` flag to the 
configuration.

This is the minimum required configuration:
```yaml
dashboard:
  dynamoDB:
    enabled: true
```

The default configuration looks like this:
```yaml
dashboard:
  dynamoDB:
    enabled: true
    metrics:
      - ProvisionedReadCapacityUnits
      - ConsumedReadCapacityUnits
      - ProvisionedWriteCapacityUnits
      - ConsumedWriteCapacityUnits
```

## Contribute
Any contribution is more than welcome. 

* Clone the code
* Install the dependencies with `npm install`
* Create a feature branch `git checkout -b new_feature`
* Lint with standard `npm run lint`
* Create a pull request

## License

This software is released under the MIT license. See [the license file](LICENSE) for more details.
