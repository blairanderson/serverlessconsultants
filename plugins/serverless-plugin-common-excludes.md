---
layout: plugin
title: Serverless Plugin Common Excludes
repo: dougmoscrop/serverless-plugin-common-excludes
homepage: 'https://github.com/dougmoscrop/serverless-plugin-common-excludes'
description: 'Adds commonly excluded files to package.excludes'
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


# serverless-plugin-common-excludes

4.0.0 switches to the package.patterns property instead of include/exclude

> Note: This plugin no longer excludes the `aws-sdk` which is in line with AWS best practices (bring your own SDK).

This plugin adds some common unnecessary items (such as docs, test code, unused configuration files, etc.) to the `package: exclude` configuration of your Serverless project to make it smaller.

Check out which files are excluded [here](https://github.com/dougmoscrop/serverless-plugin-common-excludes/blob/master/common-excludes.js).

[serverless-plugin-include-dependencies](https://github.com/dougmoscrop/serverless-plugin-include-dependencies) works with this plugin.

## Installation

Install the plugin:

```bash
npm install serverless-plugin-common-excludes --save-dev
```

Include the plugin in your `serverless.yml`:

```yaml
plugins:
  - serverless-plugin-common-excludes
```

