---
layout: plugin
title: Serverless Plugin Git Variables
repo: jacob-meacham/serverless-plugin-git-variables
homepage: 'https://github.com/jacob-meacham/serverless-plugin-git-variables'
description: 'A Serverless plugin to expose git variables (branch name, HEAD description, full commit hash) to your serverless services'
stars: 20
stars_trend: up
stars_diff: 1
forks: 9
forks_trend: 
forks_diff: 0
watchers: 20
issues: 1
issues_trend: 
issues_diff: 0
---


# serverless-plugin-git-variables
[![Coverage Status](https://coveralls.io/repos/github/jacob-meacham/serverless-plugin-git-variables/badge.svg?branch=develop)](https://coveralls.io/github/jacob-meacham/serverless-plugin-git-variables?branch=develop)
[![Build Status](https://travis-ci.org/jacob-meacham/serverless-plugin-git-variables.svg?branch=develop)](https://travis-ci.org/jacob-meacham/serverless-plugin-git-variables)

Expose git variables (HEAD description, branch name, and short commit hash) to your serverless services.

# Usage
```yaml

functions:
  processEventBatch:
    name: ${self:provider.stage}-${self:service}-process-event-batch
    description: ${git:branch} - ${git:describe} - ${git:sha1}

plugins:
  - serverless-plugin-git-variables
```

# Serverless Version Support
* If you're using serverless 1.12.x or below, use the 1.x.x version of this plugin.
* This plugin is currently broken for serverless versions between 1.13 and 1.15 (inclusive).
* If you're using serverless 1.16.x or above, use the 2.x.x version of this plugin.

# Version History
* 2.0.0
  - support Serverless >= 1.16.0
* 1.0.1
  - list babel-runtime as a dependency
* 1.0.0
  - Initial release
