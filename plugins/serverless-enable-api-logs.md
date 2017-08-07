---
layout: plugin
title: Serverless Enable Api Logs
repo: paulSambolin/serverless-enable-api-logs
homepage: 'https://github.com/paulSambolin/serverless-enable-api-logs'
topics: 
description: Enables Coudwatch logging for API Gateway events
stars: 4
stars_trend: 
forks: 3
forks_trend: 
watchers: 4
issues: 5
issues_trend: 
---


# serverless-enable-api-logs
Enables Coudwatch logging for API Gateway events

# Resources
- [Github](https://github.com/paulSambolin/serverless-enable-api-logs)
- [NPM](https://www.npmjs.com/package/serverless-enable-api-logs)

# Usage
```yaml
...

plugins:
  - serverless-enable-api-logs

...

functions:
  get:
    handler: index.handler
    events:
      - http:
          path: user/{id}
          method: get
```
