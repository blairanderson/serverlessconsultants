---
layout: plugin
title: Serverless Cloudformation Changesets
repo: trek10inc/serverless-cloudformation-changesets
homepage: 'https://github.com/trek10inc/serverless-cloudformation-changesets'
description: 'Natively deploy to CloudFormation via Change sets, instead of directly. Allowing you to queue changes, and safely require escalated roles for final deployment.'
stars: 27
stars_trend: 
stars_diff: 0
forks: 7
forks_trend: up
forks_diff: 1
watchers: 27
issues: 3
issues_trend: up
issues_diff: 1
---


# serverless-cloudformation-changesets
[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)


Serverless framework plugin to create CloudFormation ChangeSets.

## Installation

Install the plugin from npm

```bash
$ npm install --save serverless-cloudformation-changesets
```

Add the plugin to your `serverless.yml` file:

```yaml
plugins:
  - serverless-cloudformation-changesets
```

## Usage
#### CLI options
Add `--changeset` option to the sls deployment command, e.g.:
```bash
$ sls deploy --changeset --stage dev --region us-east-1
```
`--changeset` by default uses a timestamp for ChangeSet name, otherwise you can provide optional `--changeset` value:
```bash
$ sls deploy --changeset your-changeset-name --stage dev --region us-east-1
```

#### YAML settings
```yaml
custom:
  cf-changesets:
    changeSetName: whatever # optional
    requireChangeSet: boolean # optional defaults to false
```
`requireChangeSet` - if true, ChangeSets will be created without providing `--changeset` option to the `sls deploy` command.

## Notice
If CloudFormation Stack doesn't exist and custom `provider.deploymentBucket` was specified, this plugin will create a new stack without template, resources. The stack will be in the `REVIEW_IN_PROGRESS` state.
