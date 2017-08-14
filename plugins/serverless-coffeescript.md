---
layout: plugin
title: Serverless Coffeescript
repo: duanefields/serverless-coffeescript
homepage: 'https://github.com/duanefields/serverless-coffeescript'
description: A Serverless plugin to compile your CoffeeScript into JavaScript at deployment
stars: 4
stars_trend: 
stars_diff: 0
forks: 0
forks_trend: 
forks_diff: 0
watchers: 4
issues: 1
issues_trend: 
issues_diff: 0
---


# serverless-coffeescript

A quick and dirty plugin for the [Serverless Framework](https://serverless.com/) to compile coffee-script files into javascript at deploy time. Shamelessly cribbed from https://github.com/serverless/serverless-babel-plugin.

## Setup

You need to install the plugin:

```bash
npm install --save-dev serverless-coffeescript
```

Further you need to add the plugin to your `serverless.yml` and defined which preset you chose:

```yml
plugins:
  - serverless-coffeescript
```

# Usage

Simply run `serverless deploy` and it will compile every CoffeeScript file in your service
