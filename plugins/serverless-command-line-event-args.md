---
layout: plugin
title: Serverless Command Line Event Args
repo: horike37/serverless-command-line-event-args
homepage: 'https://github.com/horike37/serverless-command-line-event-args'
topics: 
description: This module is Serverless Framework plugin. Event JSON passes to your Lambda function in commandline.
stars: 12
stars_trend: 
forks: 1
forks_trend: 
watchers: 12
issues: 0
issues_trend: 
---


[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)
# Serverless CommandLine Event Args
## Overview
This is a Serverless Framework plugin. Event JSON passes to your Lambda function in commandline when you execute `serverless invoke`.
Support for Serverless 1.0.

I think useful for developers, because event.json is a little difficult to manage.

- You get lost event.json under the control of the git.
- A pain to edit the file every time you change the value of the argument.
- If specified directly in the command line, pick up from the history, it's easy

## Usage
Execute your Lambda function. Add `-e '<JSON>'` or `--event '<JSON>'`.

    $ serverless invoke -f YourFunction --event '{"foo":"var"}'

## Install
Execute npm install in your Serverless project.

    $ npm install serverless-command-line-event-args
    
Add the plugin to your `serverless.yml` file

```yml
plugins:
  - serverless-command-line-event-args
```
