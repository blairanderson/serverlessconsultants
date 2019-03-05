---
layout: plugin
title: Serverless Plugin Diff
repo: nicka/serverless-plugin-diff
homepage: 'https://github.com/nicka/serverless-plugin-diff'
description: 'Compares your local AWS CloudFormation templates against deployed ones.'
stars: 21
stars_trend: 
stars_diff: 0
forks: 2
forks_trend: 
forks_diff: 0
watchers: 21
issues: 1
issues_trend: 
issues_diff: 0
---


[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)
[![Coverage-Status](https://coveralls.io/repos/github/nicka/serverless-plugin-diff/badge.svg?branch=master)](https://coveralls.io/github/nicka/serverless-plugin-diff?branch=master)
[![Build-Status](https://travis-ci.org/nicka/serverless-plugin-diff.svg?branch=master)](https://travis-ci.org/nicka/serverless-plugin-diff)

# Serverless CloudFormation Diff

## Overview

Plugin for Serverless Framework v1.x which compares your local AWS CloudFormation templates against deployed ones.

# Usage

```bash
serverless diff --stage REPLACEME [--region REPLACEME]
```

<img width="1255" alt="screen shot 2016-11-05 at 14 53 04" src="https://cloud.githubusercontent.com/assets/195404/20030536/9e1a552c-a367-11e6-8e6d-2043f2a5d038.png">

## Command options

```bash
--diffTool ksdiff
```

Custom diff tool:

>Defaults to `diff`


```bash
--localTemplate foo.json
```

Custom CloudFormation template to diff against:

>Defaults to `./serverless/cloudformation-template-update-stack.json`

# Install

Execute npm install in your Serverless project.

```bash
npm install --save-dev serverless-plugin-diff
```

Add the plugin to your `serverless.yml` file

```yml
plugins:
  - serverless-plugin-diff
```
