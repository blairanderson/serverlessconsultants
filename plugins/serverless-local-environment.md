---
layout: plugin
title: Serverless Local Environment
repo: piercus/serverless-local-environment
homepage: 'https://github.com/piercus/serverless-local-environment'
description: 'Serverless plugin to set local environment variables and remote environment variable to different values'
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


# Serverless local variables


This plugin helps you add some conf that will only work for `serverless invoke local`

This way : 
* you can customize the behavior when running on local
* you can set another stage to use locally
* You can set variables like **LD_LIBRARY_PATH** to connact to your local environment
* You can mock your cloud ressource during your local tests


## Install

```
npm install --save-dev serverless-local-environment
```

## Usage


You can use it like 

**serverless.yml**
```yml
plugins:
  - serverless-local-environment

...

functions:
  my-function:
    handler: index.handler
    stage: dev
    environment:
      ENV: dev
    local-environment:
      ENV: local
```


# About LD_LIBRARY_PATH

Aws serverless plugin set LD_LIBRARY_PATH to `'/usr/local/lib64/node-v4.3.x/lib:/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib'` (see https://github.com/serverless/serverless/blob/4b71faf2128308894646940ce2fb64e826450972/lib/plugins/aws/invokeLocal/index.js#L95), this library is adding this value to your local LD_LIBRARY_PATH values
