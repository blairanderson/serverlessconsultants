---
layout: plugin
title: Serverless Enable Api Logs
repo: paulSambolin/serverless-enable-api-logs
homepage: 'https://github.com/paulSambolin/serverless-enable-api-logs'
description: 'Enables Coudwatch logging for API Gateway events'
stars: 14
stars_trend: 
stars_diff: 0
forks: 4
forks_trend: 
forks_diff: 0
watchers: 14
issues: 5
issues_trend: 
issues_diff: 0
---


# serverless-enable-api-logs
Enables Cloudwatch logging for API Gateway events

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
