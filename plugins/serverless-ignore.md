---
layout: plugin
title: Serverless Ignore
repo: nya1/serverless-ignore
homepage: 'https://github.com/nya1/serverless-ignore'
description: 'Serverless plugin to ignore files (.slsignore)'
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


# serverless-ignore

[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com) [![npm](https://img.shields.io/npm/v/serverless-ignore.svg)](https://www.npmjs.com/package/serverless-ignore) [![npm](https://img.shields.io/npm/dt/serverless-ignore.svg)](https://www.npmjs.com/package/serverless-ignore)


Serverless plugin to ignore files like a .gitignore

#### Why

 * Remove long list of hardcoded exclude files from serverless.yml
 * Better managing between different serverless.yml (just add a different .slsignore)
 * Same approach of .gitignore

#### Install

`npm install --save-dev serverless-ignore`

Note:

* for serverless version < 2 use version ^0.1.6

#### Usage

Add `serverless-ignore` to your plugins list (serverless.yml)

```
plugins:
  - serverless-ignore
```


Add a `.slsignore` in your root folder with a .gitignore-like syntax with all the files you want to ignore

Example:
```
# it works like a .gitignore
# for sls
README.md
*.log

# ignore aws-sdk
node_modules/aws-sdk/*

.env.example
.git/*
__tests__/*
```

