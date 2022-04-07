---
layout: plugin
title: Serverless Offline Redis Server
repo: apancutt/serverless-offline-redis-server
homepage: 'https://github.com/apancutt/serverless-offline-redis-server'
description: 'A plugin that will run a local Redis server alongside Serverless Offline'
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


# serverless-offline-redis-server

Run a local Redis server using Serverless Offline.

This plugin is intended for local development only, and is therefore only invoked on
`serverless offline start`.

## Installation

1. Install the [Redis server](https://redis.io/topics/quickstart) locally.
2. Add this plugin as a dev dependency:

    ```bash
    # NPM
    npm install --save-dev serverless-offline-redis-server
    # Yarn
    yarn add -D serverless-offline-redis-server
    ```
3. Add the plugin to your `serverless.yml` file:

    ```yaml
    plugins:
        - serverless-offline-redis-server
    ```

## Configuration

You can pass any configuration accepted by [redis-server](https://www.npmjs.com/package/redis-server) via the `custom.redis` property in your `serverless.yml`.

```yaml
service: myservice
custom:
  redis:
    port: 8888
```
