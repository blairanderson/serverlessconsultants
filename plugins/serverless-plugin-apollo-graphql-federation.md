---
layout: plugin
title: Serverless Plugin Apollo Graphql Federation
repo: Imran99/serverless-plugin-apollo-graphql-federation
homepage: 'https://github.com/Imran99/serverless-plugin-apollo-graphql-federation'
description: 'A Serverless Framework that uploads a graphql schema to the Apollo Platform managed federation service'
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


# Serverless Plugin Apollo Graphql Federation

A serverless plugin that uploads graphql schemas to Apollo managed federation. This plugin should be used in implementing services. This allows the gateway service to pull schema from apollo managed federation and also stops implementing services from uploading invalid schemas that would cause the gateway to fail.

## Usage

Install with npm

```sh
npm i -D serverless-plugin-apollo-graphql-federation
```

Add to serverless.yml

```yml
plugins:
  - serverless-plugin-apollo-graphql-federation
```

```yml
service:
  custom:
    apolloGraphQLFederation:
      uploadForDeploymentRegion: eu-west-2
      graphs:
        - name: 'myGraph'
          apolloKey: apollo-api-key-for-my-graph
          url: https://my-implementing-service/mygraphendpoint
          schema: './myGraph/schema.gql',
```

Deploy using `sls deploy --region xxx` or `sls apollo service:push`

`uploadForDeploymentRegion` (optional) is used for multi-region deployments where the same api is deployed to multiple AWS regions. If you encounter intermittent Apollo schema validation failures when doing simultaneous regional deployments, try setting this variable to one of your deployment regions. The schema only needs to be uploaded for a single region.

## Couldn't I just use the serverless-hooks-plugin to do this?
Yes you could but this would potentially log your apolloKey in your build server logs which is undesirable.
