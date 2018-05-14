---
layout: plugin
title: Serverless Plugin Encode Env Var Objects
repo: yonomi/serverless-plugin-encode-env-var-objects
homepage: 'https://github.com/yonomi/serverless-plugin-encode-env-var-objects'
description: 'Serverless plugin to encode any environment variable objects.'
stars: 0
stars_trend: 
stars_diff: 0
forks: 2
forks_trend: 
forks_diff: 0
watchers: 0
issues: 1
issues_trend: 
issues_diff: 0
---


# serverless-plugin-encode-env-var-objects

Serverless plugin to encode any environment variable objects.

AWS Lambda/CloudFormation does not allow for environment variables to be of type object.

This [Serverless](http://serverless.com) plugin will check any environment variables under `provider` and `functions`.  If the environment variable is an object the plugin will resave the variable as a base64 stringified version.

Base64 encoding is required because commas are not allowed in AWS Lambda environment variables.

To use, add it to your `serverless.yml` under plugins:

```
plugins:
  - serverless-plugin-encode-env-var-objects
```

Select specific environment variable names to encode by including an array of names as under the custom property `encodeEnvObjects`. If `encodeEnvObjects` is not defined, all objects will be encoded. Example:

```
custom:
  encodeEnvObjects:
    - ONLY_THIS_ENV
```
