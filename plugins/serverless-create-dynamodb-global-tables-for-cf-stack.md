---
layout: plugin
title: Serverless Create Dynamodb Global Tables For Cf Stack
repo: Imran99/serverless-create-dynamodb-global-tables-for-cf-stack
homepage: 'https://github.com/Imran99/serverless-create-dynamodb-global-tables-for-cf-stack'
description: 'Create and replicate global dynamodb tables'
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


# Serverless Create DynamoDB Global Tables For CF Stack

A Serverless plugin that will add a global table and replica region for all tables deployed in a serverless stack.

DynamoDB currently imposes some strict limitations when [creating global tables](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables_reqs_bestpractices.html):
- The table provisioning settings must match for each regional table
- The table names must match
- Streams must be enabled
- All tables must be empty
- If a replica table is removed from a global table it can not be added again. You can however drop the table and recreate it to add it to global replication.

The plugin handles these limitation by enabling global replication for all tables defined in the serverless stack and thus tying the global tables lifecycle to the table resources defined in the stack. Adding and removing tables from the stack will add and remove them from replication.

## Install

```sh
$ npm install serverless-create-dynamodb-global-tables-for-cf-stack --save-dev
```

Add the plugin to your `serverless.yml` file:

```yml
plugins:
  - serverless-create-dynamodb-global-tables-for-cf-stack
```
 
## Usage

Simply deploy your stack to each region you wish to add to the replication group. Remove your stack from each region that you no longer want in replication.

```sh
serverless deploy --region us-east-1
serverless deploy --region eu-west-1
```

When you add/remove table resources from your serverless stack they will also be added/removed from global replication but you will need to redeploy your stack to each region.

## Disabling

The plugin is enabled by default. You can disable the plugin via config. You may want to do this in certain environments for example.

```yml
custom:
  createDynamoDBGlobalTables:
    enabled: ${self:custom.variables.${self:custom.variables.stage}.enabled}
```

Disabling the plugin after deploying the stack will have no effect on global tables that were previously deployed. This is due to the previously mentioned limitations of dyanmodb global tables.
