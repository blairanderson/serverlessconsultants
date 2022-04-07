---
layout: plugin
title: Serverless Print Resolved Plugin
repo: neverendingqs/serverless-print-resolved-plugin
homepage: 'https://github.com/neverendingqs/serverless-print-resolved-plugin'
description: 'Generate a copy of serverless.yml with all variables resolved.'
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


[![CircleCI](https://circleci.com/gh/neverendingqs/serverless-print-resolved-plugin.svg?style=svg)](https://circleci.com/gh/neverendingqs/serverless-print-resolved-plugin)
[![npm version](https://badge.fury.io/js/serverless-print-resolved-plugin.svg)](https://badge.fury.io/js/serverless-print-resolved-plugin)

# serverless-print-resolved-plugin

This plugin generates a copy of `serverless.yml` with all Serverless variables
resolved to actual values. It can also write additional metadata that is
available.

## Usage

Install the plugin:

```sh
npm install -D serverless-print-resolved-plugin
```

Register the plugin in `serverless.yml`:

```yaml
plugins:
  - serverless-print-resolved-plugin
```

After `package` / `deploy`, `.serverless/serverless-resolved.yml` will contain a
copy of `serverless.yml` but with all variables resolved.

To include more metadata from the `serverless` object, add the following to
`serverless.yml`:

```yaml
custom:
  print-resolved:
    # Paths are followed using `lodash.get()`
    paths:
      - serverless.pluginManager.hooks
      - serverless.variables.option
```

Note: objects / properties considered invalid by
[js-yaml](https://github.com/nodeca/js-yaml) are skipped.
