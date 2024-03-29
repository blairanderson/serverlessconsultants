---
layout: plugin
title: Serverless Cloudformation Parameter Setter
repo: trek10inc/serverless-cloudformation-parameter-setter
homepage: 'https://github.com/trek10inc/serverless-cloudformation-parameter-setter'
description: 'Set CloudFormation parameters when deploying.'
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


# serverless-cloudformation-parameter-setter
[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)

Serverless framework plugin to set CloudFormation Parameters when deploying

## Installation

Install the plugin from npm

```bash
$ npm install --save serverless-cloudformation-parameter-setter
```

Add the plugin to your `serverless.yml` file:

```yaml
plugins:
  - serverless-cloudformation-parameter-setter
```

## Usage
#### CLI options
None

#### YAML settings
```yaml
custom:
  cf-parameters:
    secretPassword: whatever # this could be serverless ssm variable or s3 variable or plaintext or whatever, do what you want

resources:
  # define the cloudformation parameters here
  Parameters:
    secretPassword:
      Type: string
      Description: database password
      NoEcho: true # keep it secret, keep it safe
  # use the parameters here
  Resources:
    TheDatabase:
      Type: AWS::RDS::DBInstance
      Properties:
        Engine: MySQL
        DBInstanceIdentifier: MySQL
        DBName: MySQL
        MultiAZ: true
        PubliclyAccessible: true
        MasterUsername: root
        MasterUserPassword: { Ref: secretPassword } # you can also send this to a lambda's env var
        DBInstanceClass: db.t2.large
        AllocatedStorage: 100
        DBSubnetGroupName:
          Ref: DBSubnetGroup # not included in this example
        VPCSecurityGroups:
          - Ref: DBSecurityGroup # not included in this example
```

