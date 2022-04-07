---
layout: plugin
title: Serverless Api Compression
repo: evgenykireev/serverless-api-compression
homepage: 'https://github.com/evgenykireev/serverless-api-compression'
description: 'Serverless plugin that enables/disables content compression setting in API Gateway'
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


# serverless-content-compression
Serverless plugin that enables/disables content compression setting in API Gateway

## Deprecated
Serverless Framework now supports this functionality out of the box.
Example:

```
provider:
  name: aws
  apiGateway:
    minimumCompressionSize: 1024
```


## How to use
1. `npm install --save-dev serverless-api-compression`

2. Add plugin to your `serverless.yml` config
 ```
 plugins:
    - serverless-api-compression
```

3. Add `contentCompression` attribute to your `custom` section
```
 custom:
  contentCompression: 1024

```

 `contentCompression` value is a MinimumCompressionSize in bytes. Use `0` to enable compression for all responses.
 Use `null` or `false` to disable it.
