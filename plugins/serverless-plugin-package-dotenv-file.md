---
layout: plugin
title: Serverless Plugin Package Dotenv File
repo: ACloudGuru/serverless-plugin-package-dotenv-file
homepage: 'https://github.com/ACloudGuru/serverless-plugin-package-dotenv-file'
topics: 
description: A Serverless plugin to copy a .env file into the serverless package
stars: 8
stars_trend: 
forks: 1
forks_trend: 
watchers: 8
issues: 0
issues_trend: 
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
