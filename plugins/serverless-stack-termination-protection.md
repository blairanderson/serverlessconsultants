---
layout: plugin
title: Serverless Stack Termination Protection
repo: miguel-a-calles-mba/serverless-stack-termination-protection
homepage: 'https://github.com/miguel-a-calles-mba/serverless-stack-termination-protection'
description: 'Serverless plugin to update the CloudFormation stack termination protection.'
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


# Serverless Stack Termination Protection Plugin

## Table of Contents

1. [Description](#description)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Using the Plugin](#using-the-plugin)
5. [Notes](#notes)
6. [License](#license)

## Description

Following deployment, the Serverless Framework does not have the option to enable termination protection for the CloudFormation stack. This plugins will enable the termination protection. It can also disable it by using a command line option. This plugin is designed for the Serverless Framework 1.x.

## Requirements

- Serverless Framework 1.x.
- Node 8.x or greater.
- NPM 6.x or greater.

## Installation

### Installing the Serverless Framework

Visit the [Getting Started with the Serverless Framework](https://serverless.com/framework/docs/getting-started) to get started with the Serverless Framework.

Install with **npm**:

```sh
npm install -g serverless
```

### Installing the Plugin

Install with **npm**:

```sh
npm install --save-dev serverless-stack-termination-protection
```

And then add the plugin to your `serverless.yml` file:

```yaml
plugins:
  - serverless-stack-termination-protection
```

See the [example(s)](./examples).

## Using the Plugin

### Automatically Enable Termination Protection After Deployment

This plugin enables termination protection automatically after the deployment. Simply run the **deploy**:

```sh
sls deploy
```

### Automatically Disable Termination Protection After Deployment

This plugin can disable termination protection automatically after the deployment. Simply run the **deploy** with the **--disable-termination-protection** option:

```sh
sls deploy --disable-termination-protection
```

### Apply Protection to Specified Stages

You may apply protection for specific stages by listing the stages under a **serverlessTerminationProtection** custom property in the serverless yaml file.

```yaml
custom:
  serverlessTerminationProtection:
    stages:
      - prod
```

### Notes

Future version will:

* Delete the stack forceably using `sls remove --force`.

Please request features or report problems using the [issues](https://github.com/miguel-a-calles-mba/serverless-stack-termination-protection/issues) page.

## License

See the included [LICENSE](LICENSE) for rights and limitations under the terms of the MIT license.
