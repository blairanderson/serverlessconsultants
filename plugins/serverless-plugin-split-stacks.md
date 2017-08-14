---
layout: plugin
title: Serverless Plugin Split Stacks
repo: dougmoscrop/serverless-plugin-split-stacks
homepage: 'https://github.com/dougmoscrop/serverless-plugin-split-stacks'
description: Migrate certain resources to nested stacks
stars: 8
stars_trend: 
stars_diff: 0
forks: 0
forks_trend: 
forks_diff: 0
watchers: 8
issues: 4
issues_trend: 
issues_diff: 0
---


Be advised: This plugin currently migrates the `RestApi` resource to a nested stack, which causes your URL to change.

# serverless-plugin-split-stacks

The goal if this plugin is to split some resources off in to nested stacks to work around the 200 CloudFormation resource limit.

Migrating resources to nested stacks is tricky beacuse some plugins rely on querying the resource from the main stack and would need to understand this. There are also plenty of issues with moving resources in existing deployments (you frequently get 'resource already exists' errors). Because of this, this plugin is very conservative. It moves only resources of types that seem to be easy to move.

You can see a list of migrations in `lib/migrate-resources.js`.

## Limitations

You should try to limit the number of functions you have in your service to 20 or so. This plugin is not a substitute for fine-grained services - but even with a domain of a single entity and sub-entity, CRUD operations on each and some stream listeners its easy to exceed 200 resources once monitoring is in place.
