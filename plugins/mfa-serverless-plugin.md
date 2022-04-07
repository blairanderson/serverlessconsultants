---
layout: plugin
title: Mfa Serverless Plugin
repo: alikian/mfa-serverless-plugin
homepage: 'https://github.com/alikian/mfa-serverless-plugin'
description: 'A simple plugin for deployment accounts with MFA'
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


# mfa-serverless-plugin
MFA Serverless plugin


## Set following environments variables
Serial Nuber or arn of MFA 
```
AWS_MFA_SERIAL_NUMBER=arn:aws:iam::12345678910:mfa/mfa_user
```

MFA Key, it can be access only when setting up MFA first time
```
AWS_MFA_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

## install plugin
```
npm install --save mfa-serverless-plugin
```

## add plugin to your serverless.yml

```
plugins:
  - mfa-serverless-plugin
```
