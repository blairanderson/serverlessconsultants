---
layout: plugin
title: Serverless Cloudformation Changesets
repo: trek10inc/serverless-cloudformation-changesets
homepage: 'https://github.com/trek10inc/serverless-cloudformation-changesets'
description: 'Natively deploy to CloudFormation via Change sets, instead of directly. Allowing you to queue changes, and safely require escalated roles for final deployment.'
stars: 17
stars_trend: 
stars_diff: 0
forks: 2
forks_trend: 
forks_diff: 0
watchers: 17
issues: 1
issues_trend: 
issues_diff: 0
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
