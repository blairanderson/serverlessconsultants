---
layout: plugin
title: Serverless Plugin Inject Dependencies
repo: loanmarket/serverless-plugin-inject-dependencies
homepage: 'https://github.com/loanmarket/serverless-plugin-inject-dependencies'
description: 'Painlessly deploy serverless projects with only the required dependencies.'
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


# serverless-plugin-inject-dependencies

[![Build Status](https://travis-ci.org/e-e-e/serverless-plugin-inject-dependencies.svg?branch=master)](https://travis-ci.org/e-e-e/serverless-plugin-inject-dependencies)
[![Coverage Status](https://coveralls.io/repos/github/e-e-e/serverless-plugin-inject-dependencies/badge.svg?branch=master)](https://coveralls.io/github/e-e-e/serverless-plugin-inject-dependencies?branch=master)

Easily include only required code your serverless package.

This plugin analyses all handlers in your `serverless.yml` configuration and modifies serverless includes/excludes options accordingly.

## Installation

First install the plugin via NPM.

```
npm install serverless-plugin-inject-dependencies --save-dev
```

Then include the plugin within your serverless.yml config.

```yml
plugins:
  - serverless-plugin-inject-dependencies
```
