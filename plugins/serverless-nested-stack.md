---
layout: plugin
title: Serverless Nested Stack
repo: jagdish-176/serverless-nested-stack
homepage: 'https://github.com/jagdish-176/serverless-nested-stack'
description: 'A plugin to Workaround for Cloudformation 200 resource limit'
stars: 7
stars_trend: 
stars_diff: 0
forks: 0
forks_trend: 
forks_diff: 0
watchers: 7
issues: 2
issues_trend: 
issues_diff: 0
---


# Serverless Nested Stack
Serverless plugin to Workaround for Cloudformation 200 resource limit 

**Install**

Run `npm install` in your Serverless project.

    $ npm install serverless-nested-stack --save-dev

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
