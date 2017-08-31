---
layout: plugin
title: Serverless Nested Stack
repo: jagdish-176/serverless-nested-stack
homepage: 'https://github.com/jagdish-176/serverless-nested-stack'
description: A plugin to Workaround for Cloudformation 200 resource limit
stars: 5
stars_trend: 
stars_diff: 0
forks: 0
forks_trend: 
forks_diff: 0
watchers: 5
issues: 1
issues_trend: up
issues_diff: 1
---


# Serverless Nested Stack
Serverless plugin to Workaround for Cloudformation 200 resource limit 

**Install**

Run `npm install` in your Serverless project.

    $ npm install --save-dev https://github.com/jagdish-176/serverless-nested-stack#0.0.0

Add the plugin to your serverless.yml file

    plugins:
      - serverless-nested-stack


When you deploy using 

    sls deploy 

nested stack will be created using following structure

Parent-Stack

    - LogStack
    - ApiStack

1) Parent-Stack Contains LogStack & ApiStack
2) LogStack contains LogGroups & Roles
3) ApiStack Contains Lambda functions and other resource

Note: Currently Tested with Lambda Functions, Api Resources & StepFunctions
