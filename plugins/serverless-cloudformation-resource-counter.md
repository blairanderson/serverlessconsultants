---
layout: plugin
title: Serverless Cloudformation Resource Counter
repo: drexler/serverless-cloudformation-resource-counter
homepage: 'https://github.com/drexler/serverless-cloudformation-resource-counter'
description: 'A plugin to count the resources generated in the AWS CloudFormation stack after deployment.'
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


## Serverless Cloudformation Resource Counter Plugin

[![npm](https://img.shields.io/npm/v/serverless-cloudformation-resource-counter.svg)](https://www.npmjs.com/package/serverless-cloudformation-resource-counter)
[![license](https://img.shields.io/github/license/drexler/serverless-cloudformation-resource-counter.svg)](https://github.com/drexler/serverless-cloudformation-resource-counter/blob/master/LICENSE.md)
[![downloads](https://img.shields.io/npm/dt/serverless-cloudformation-resource-counter.svg)](https://www.npmjs.com/package/serverless-cloudformation-resource-counter)
[![codecov](https://codecov.io/gh/drexler/serverless-cloudformation-resource-counter/branch/master/graph/badge.svg)](https://codecov.io/gh/drexler/serverless-cloudformation-resource-counter)
[![Build Status](https://travis-ci.org/drexler/serverless-cloudformation-resource-counter.svg?branch=master)](https://travis-ci.org/drexler/serverless-cloudformation-resource-counter.svg?branch=master)

A [serverless](https://serverless.com) plugin to count the resources generated in the AWS CloudFormation stack after deployment. It provides an option to warn users when a preset number of resources have been created. This is particularly useful when trying to avoid the 500 resource limit set by CloudFormation.

## Usage

### Install

```bash
$ yarn add serverless-cloudformation-resource-counter
```

```bash
$ npm install serverless-cloudformation-resource-counter
```

### Configuration

```yaml
plugins:
    - serverless-cloudformation-resource-counter

custom:
    warningThreshold: 13
```

## License

Feel free to use the code, it's released using the [MIT license](LICENSE.md).
