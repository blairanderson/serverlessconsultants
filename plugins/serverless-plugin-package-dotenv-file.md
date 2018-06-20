---
layout: plugin
title: Serverless Plugin Package Dotenv File
repo: ACloudGuru/serverless-plugin-package-dotenv-file
homepage: 'https://github.com/ACloudGuru/serverless-plugin-package-dotenv-file'
description: 'A Serverless plugin to copy a .env file into the serverless package'
stars: 12
stars_trend: up
stars_diff: 2
forks: 4
forks_trend: up
forks_diff: 1
watchers: 12
issues: 0
issues_trend: 
issues_diff: 0
---


# Serverless Package Env Plugin [![Build Status](https://travis-ci.org/ACloudGuru/serverless-plugin-package-dotenv-file.svg?branch=master)](https://travis-ci.org/ACloudGuru/serverless-plugin-package-dotenv-file)

A Serverless plugin to copy a .env file into the serverless package


## Installation
`npm i serverless-plugin-package-dotenv-file`

## Usage

```
service: your-service
...
custom:
  packageEnv:
    fileName: .env-${env:ENVIRONMENT}

plugins:
  - serverless-plugin-package-dotenv-file
```
