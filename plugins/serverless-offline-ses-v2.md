---
layout: plugin
title: Serverless Offline Ses V2
repo: domdomegg/serverless-offline-ses-v2
homepage: 'https://github.com/domdomegg/serverless-offline-ses-v2'
description: 'Serverless plugin to run a local version of Amazon Simple Email Service (SES) supporting the V2 API'
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


# serverless-offline-ses-v2

Serverless plugin to run [aws-ses-v2-local](https://github.com/domdomegg/aws-ses-v2-local)

## Install

```
npm install --save-dev serverless-offline-ses-v2
```

## Usage

### Serverless configuration

Add it to your list of plugins, and optinally custom config

serverless.yaml:

```yaml
plugins:
  - serverless-offline
  - serverless-offline-ses-v2

custom:
  serverless-offline-ses-v2:
    port: 8005
```

serverless.js / serverless.ts:

```ts
export default {
  plugins: [
    "serverless-offline",
    "serverless-offline-ses-v2",
  ],
  custom: {
    'serverless-offline-ses-v2': {
      port: 8005,
    }
  }
}
```

### Running serverless-offline

Use `serverless offline start` instead of `serverless offline`, if you aren't already. This is necessary for serverless-offline to fire off `init` and `end` lifecycle hooks so that we can start and stop the aws-ses-v2-local server correctly.
