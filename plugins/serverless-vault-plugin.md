---
layout: plugin
title: Serverless Vault Plugin
repo: Rondineli/serverless-vault-plugin
homepage: 'https://github.com/Rondineli/serverless-vault-plugin'
description: 'A Serverless plugin to retrieve passwords from vault and encrypt to kms'
stars: 6
stars_trend: 
stars_diff: 0
forks: 2
forks_trend: 
forks_diff: 0
watchers: 6
issues: 2
issues_trend: 
issues_diff: 0
---


# serverless-vault-plugin

[![CircleCI](https://circleci.com/gh/Rondineli/serverless-vault-plugin/tree/master.svg?style=svg)](https://circleci.com/gh/Rondineli/serverless-vault-plugin/tree/master)


## Why?
[Vault](https://learn.hashicorp.com/vault/) is an amazing tool to use to store secrets.

Since I started using lambda + serverless, I have been looking for something that could allow me deploy in a safe way (avoiding writing environment files or commiting my passwords on github to be able using a continuous deployment, so I decided to write my own plugin to solve this problem.

## Why not SSM?
I have been using vault as my store secret and it's been working well since then I have managed to keep using it to any apps based on app authentication or keys trought my vault api. When we decided move to lambda we didn't want to move anything else to aws (I know we are lock-in), but then we decided to keep vault as our secret manager.

## Why KMS then?
Although we are using Vault, once we retrieve the secrets from it, they go plain text (not desirable). So, I just store my secrets in KMS after we retrieve them from Vault and then my Lambda function will be able to decrypt them.

## Topology
![* Topology](img/topology.png)

## How to use it?
### Add those configs in your `serverless.yml`

#### Using token method auth
```
custom:
  config: ${file(env/${opt:stage}.yml)}

  vault:
    token: "<app token>"
    url: "https://vault:8200"
    secret: "secret/path"
    ssl_check: false
  kms:
    keyId: ${env:KEY_KMS_ID}
```
#### Using Userpass auth
```
custom:
  config: ${file(env/${opt:stage}.yml)}

  vault:
    method: "Userpass"
    user: "my vault user"
    password: "my user password"
    url: "https://vault:8200"
    secret: "secret/path"
    ssl_check: false
  kms:
    keyId: ${env:KEY_KMS_ID}
```


### Add your env var as a list
```
environment:
  - VAR_FOO
  - VAR_BAR
```

Once you run `sls deploy -s <stage>`, it will fetch the vault and will try to find `VAR_FOOR`, `VAR_BAR` (using your secret path). It will then encrypt it on KMS and set the environment variables to your deployment runtime.
