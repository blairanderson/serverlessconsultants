---
layout: plugin
title: Serverless Scriptable Plugin
repo: weixu365/serverless-scriptable-plugin
homepage: 'https://github.com/weixu365/serverless-scriptable-plugin'
description: 'Customize Serverless behavior without writing a plugin.'
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


[![npm version](https://badge.fury.io/js/serverless-scriptable-plugin.svg)](https://badge.fury.io/js/serverless-scriptable-plugin)
![npm](https://img.shields.io/npm/dw/serverless-scriptable-plugin?style=plastic)
[![Build Status](https://travis-ci.org/weixu365/serverless-scriptable-plugin.svg?branch=master)](https://travis-ci.org/weixu365/serverless-scriptable-plugin)
[![Test Coverage](https://codeclimate.com/github/weixu365/serverless-scriptable-plugin/badges/coverage.svg)](https://codeclimate.com/github/weixu365/serverless-scriptable-plugin/coverage)
[![Code Climate](https://codeclimate.com/github/weixu365/serverless-scriptable-plugin/badges/gpa.svg)](https://codeclimate.com/github/weixu365/serverless-scriptable-plugin)
[![Issue Count](https://codeclimate.com/github/weixu365/serverless-scriptable-plugin/badges/issue_count.svg)](https://codeclimate.com/github/weixu365/serverless-scriptable-plugin)
[![license](https://img.shields.io/npm/l/serverless-scriptable-plugin.svg)](https://www.npmjs.com/package/serverless-scriptable-plugin)

## What's the plugins for?
This plugin allows you to write scripts to customize Serverless behavior for Serverless 1.x and upper

It also supports running node.js scripts in any build stage.

Features:
- Run any command or nodejs scripts in any stage of serverless lifecycle
- Add custom commands to serverless, e.g. `npx serverless YOUR-COMMAND` [Example](#custom-command)

## Quick Start
1. Install
    ```bash
    npm install --save-dev serverless-scriptable-plugin
    ```
2. Add to Serverless config 
    ```yaml
    plugins:
      - serverless-scriptable-plugin

    custom:
      scriptable:
        # add custom hooks
        hooks:
          before:package:createDeploymentArtifacts: npm run build

        # or custom commands
        commands:
          migrate: echo Running migration
    ```

## Upgrade from <=1.1.0
This `serverless-scriptable-plugin` now supports event hooks and custom commands. Here's an example of upgrade to the latest schema. The previous config schema still works for backward compatibility.

Example that using the previous schema:

```yaml
plugins:
  - serverless-scriptable-plugin

custom:
  scriptHooks:
    before:package:createDeploymentArtifacts: npm run build
```

Changed to:
```yaml
plugins:
  - serverless-scriptable-plugin

custom:
  scriptable:
    hooks:
      before:package:createDeploymentArtifacts: npm run build
```

## Example
1. Customize package behavior

    The following config is using babel for transcompilation and packaging only the required folders: dist and node_modules without aws-sdk

    ```yml
    plugins:
      - serverless-scriptable-plugin

    custom:
      scriptable:
        hooks:
          before:package:createDeploymentArtifacts: npm run build

    package:
      exclude:
        - '**/**'
        - '!dist/**'
        - '!node_modules/**'
        - node_modules/aws-sdk/**
    ```

2. <a name="custom-command"></a>Add a custom command to serverless
    ```yaml
    plugins:
      - serverless-scriptable-plugin

    custom:
      scriptable:
        hooks:
          before:migrate:command: echo before migrating
          after:migrate:command: echo after migrating
        commands:
          migrate: echo Running migration
    ```
        
    Then you could run this command by:
    ```bash
    $ npx serverless migrate
    Running command: echo before migrating
    before migrating
    Running command: echo Running migrating
    Running migrating
    Running command: echo after migrating
    after migrating
    ```

3. Deploy python code to AWS lambda
    ```yml
    plugins:
      - serverless-scriptable-plugin
    
    custom:
      scriptable:
          hooks:
            after:package:createDeploymentArtifacts: make package

    # serverless will package a zip file, then we will override the file using `make package`
    package:
      patterns:
        - "!**"
        - "<your src folder>/**"
    ```

    and a make target to create the desired zip file (https://docs.aws.amazon.com/lambda/latest/dg/python-package.html)

    ```makefile
    package:
      rm -rf output && mkdir -p output
      pip install -q -r requirements.txt --target output/libs
      (cd output/libs && zip -r ../your-service-name.zip . -x '*__pycache__*')
      (zip -r output/your-service-name.zip your-src-folder -x '*__pycache__*')
    ```

    Serverless would then deploy the zip file you built to aws lambda.

3. Run any command as a hook script

    It's possible to run any command as the hook script, e.g. use the following command to zip the required folders
 
    ```yml
    plugins:
      - serverless-scriptable-plugin
    
    custom:
      scriptable:
        hooks:
          after:package:createDeploymentArtifacts: zip -q -r .serverless/package.zip src node_modules
    
    service: service-name
    package:
      artifact: .serverless/package.zip
    ```
   
4. Create CloudWatch Log subscription filter for all Lambda function Log groups, e.g. subscribe to a Kinesis stream
  
    ```yml
    plugins:
      - serverless-scriptable-plugin
    
    custom:
      scriptable:
        hooks:
          after:package:compileEvents: build/serverless/add-log-subscriptions.js
    
    provider:
      logSubscriptionDestinationArn: 'arn:aws:logs:ap-southeast-2:{account-id}:destination:'
    ```

    and in build/serverless/add-log-subscriptions.js file:

    ```js
    const resources = serverless.service.provider.compiledCloudFormationTemplate.Resources;
    const logSubscriptionDestinationArn = serverless.service.provider.logSubscriptionDestinationArn;
    
    Object.keys(resources)
      .filter(name => resources[name].Type === 'AWS::Logs::LogGroup')
      .forEach(logGroupName => resources[`${logGroupName}Subscription`] = {
          Type: "AWS::Logs::SubscriptionFilter",
          Properties: {
            DestinationArn: logSubscriptionDestinationArn,
            FilterPattern: ".",
            LogGroupName: { "Ref": logGroupName }
          }
        }
      );
    ```

5. Run multiple commands for the serverless event

   It's possible to run multiple commands for the same serverless event, e.g. Add CloudWatch log subscription and dynamodb auto scaling support

    ```yml
    plugins:
      - serverless-scriptable-plugin
    
    custom:
      scriptable:
        hooks:
          after:package:createDeploymentArtifacts: 
            - build/serverless/add-log-subscriptions.js
            - build/serverless/add-dynamodb-auto-scaling.js
    
    service: service-name
    package:
      artifact: .serverless/package.zip
    ```


6. Suppress console output (Optional)
   You could control what to show during running commands, in case there are sensitive info in command or console output.

    ```yml
    custom:
      scriptable:
        showStdoutOutput: false # Default true. true: output stderr to console, false: output nothing
        showStderrOutput: false # Default true. true: output stderr to console, false: output nothing
        showCommands: false # Default true. true: show the command before execute, false: do not show commands

        hooks:
          ...
        commands:
          ...
    ```

## Hooks
The serverless lifecycle hooks are different to providers, here's a reference of AWS hooks:
https://gist.github.com/HyperBrain/50d38027a8f57778d5b0f135d80ea406#file-lifecycle-cheat-sheet-md

## Change Log
- Version 0.8.0 and above
  - Check details at https://github.com/weixu365/serverless-scriptable-plugin/releases

- Version 0.7.1
  - [Feature] Fix vulnerability warning by remove unnecessary dev dependencies
- Version 0.7.0
  - [Feature] Return promise object to let serverless to wait until script is finished
- Version 0.6.0
  - [Feature] Supported execute multiple script/command for the same serverless event
- Version 0.5.0
  - [Feature] Supported serverless variables in script/command
  - [Improvement] Integrated with codeclimate for code analysis and test coverage
- Version 0.4.0
  - [Feature] Supported colored output in script/command
  - [Improvement] Integrated with travis for CI
- Version 0.3.0
  - [Feature] Supported to execute any command for serverless event
- Version 0.2.0
  - [Feature] Supported to execute javascript file for serverless event
