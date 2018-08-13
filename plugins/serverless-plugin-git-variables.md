---
layout: plugin
title: Serverless Plugin Git Variables
repo: jacob-meacham/serverless-plugin-git-variables
homepage: 'https://github.com/jacob-meacham/serverless-plugin-git-variables'
description: 'A Serverless plugin to expose git variables (branch name, HEAD description, full commit hash) to your serverless services'
stars: 25
stars_trend: 
stars_diff: 0
forks: 13
forks_trend: 
forks_diff: 0
watchers: 25
issues: 3
issues_trend: 
issues_diff: 0
---


# serverless-plugin-git-variables
[![Coverage Status](https://coveralls.io/repos/github/jacob-meacham/serverless-plugin-git-variables/badge.svg?branch=develop)](https://coveralls.io/github/jacob-meacham/serverless-plugin-git-variables?branch=develop)
[![Build Status](https://travis-ci.org/jacob-meacham/serverless-plugin-git-variables.svg?branch=develop)](https://travis-ci.org/jacob-meacham/serverless-plugin-git-variables)

Expose git variables (HEAD description, branch name, short commit hash, message, and if the local repo has changed files) to your serverless services.
Moreover, it adds GIT related environment variables and tags (GIT_COMMIT_SHORT, GIT_COMMIT_LONG, GIT_BRANCH, GIT_IS_DIRTY) for each defined function in the serverless file. You can disable this by adding the following custom variable in your serverless.yml file:

```
custom:
  exportGitVariables: false
```

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
* If you're using serverless 1.16.x or above, use the >=2.x.x version of this plugin.

# Version History
* 3.1.1
  - Fix issue that occurs if a function has no environment specified (Thanks to @arnaudh-nutonomy)
* 3.1.0
  - Plugin now also adds environment variables that are accessible at runtime (Thanks to @chechu)
* 3.0.0
  - Add support for long commit hash (Thanks to @e-e-e)
  - backwards incompatible change: git describe now uses --always, so if there are not tags it returns a hash instead of failing (Thanks to @e-e-e)
* 2.1.1
  - Fix packaging issue
* 2.1.0
  - Add support for git message (Thanks to @campadrenalin)
* 2.0.0
  - support Serverless >= 1.16.0
* 1.0.1
  - list babel-runtime as a dependency
* 1.0.0
  - Initial release
