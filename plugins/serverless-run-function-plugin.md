---
layout: plugin
title: Serverless Run Function Plugin
repo: lithin/serverless-run-function-plugin
homepage: 'https://github.com/lithin/serverless-run-function-plugin'
description: 'Run serverless function locally'
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


# Serverless Run Function Plugin

**This plugin is deprecated since it is possible to run functions natively in the framework: https://serverless.com/framework/docs/providers/aws/cli-reference/invoke-local/**

Serverless plugin to run a lambda function locally.

To use, add it to your `serverless.yml` under plugins:

```
functions:
  hello:
    handler: handler.hello

plugins:
  - serverless-run-function-plugin
```

Then run `sls run -f hello` to run the function.

Functionality is the same as it used to be in core serverless v0.

### Roadmap
- Test that it actually works ;)
- Each test case should have only one assertion
- Add back eslint rule for default exports
- Version checking for correct version of serverless

### Goals
- Replace v0.5 runFunction Plugin
- Integrate plugin into core serverless

### Contribution guidelines
- Write TDD
- Use Airbnb es linter
- Write as functional code as possible
