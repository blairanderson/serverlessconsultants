---
layout: plugin
title: Serverless Resource Policy
repo: HubSpotWebTeam/serverless-resource-policy
homepage: 'https://github.com/HubSpotWebTeam/serverless-resource-policy'
description: 'Creates a whitelist of IP or CIDR addresses using serverless resource policies'
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


# Serverless Resource Policy

Creates a whitelist for IP or CIDR addresses accessing a serverless application, using serverless resource policies. This enables you to allow requests only from the IP or CIDR addresses you specify.

## Private and Public Stages

CIDR and IP addresses are whitelisted by stages.

- `privateStages`: Private to whitelisted CIDR and IP addresses. In the example below, our `dev` and `staging` stages are `privateStages`, so only those CIDR and IP addresses can access `dev` and `staging`.
- `publicStages`: No whitelisting necessary. These stages are public to all CIDR and IP addresses.

## How to Use

1. Install in your serverless application: `npm install --save serverless-resource-policy`
2. In your `serverless.yml` file, add the `serverless-resource-plugin`, for example:
   ```
   plugins:
   - serverless-resource-policy
   ```
3. Within the `provider` block, add a `stage` variable:
   ```
   provider:
     stage: ${opt:stage, 'dev'}
   ```
4. Within a `custom` block, add:
   ```
   custom:
     serverless-resource-policy:
       stage: ${self:provider.stage}
       privateStages:
         - dev
         - staging
       publicStages:
         - production
       netblocks:
         - 123.45.67.890/30
         - 987.65.432.109
   ```

> The `netblocks` object will contain the list of whitelisted IPs.

### Full Example

```
# serverless.yml

service: my-service-name

plugins:
  - serverless-resource-policy

provider:
  stage: ${opt:stage, 'dev'}

custom:
  serverless-resource-policy:
    stage: ${self:provider.stage}
    privateStages:
      - dev
      - staging
    publicStages:
      - production
    netblocks:
      - 123.45.67.890/30
      - 987.65.432.109
```

# Contributing

Currently maintained by the lovely folks on HubSpot's Web Team, but we need your help. Please feel free to submit pull requests to add new functionality.
