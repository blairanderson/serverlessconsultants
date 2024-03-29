---
layout: plugin
title: Serverless Plugin Cronjob
repo: martinlindenberg/serverless-plugin-cronjob
homepage: 'https://github.com/martinlindenberg/serverless-plugin-cronjob'
description: 'This plugin creates cronjobs out of your lambda functions.'
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


Serverless Plugin CRONJOB
=========================

[![NPM](https://nodei.co/npm/serverless-plugin-cronjob.png?downloads=true)](https://nodei.co/npm/serverless-plugin-cronjob/)

This plugin creates cronjobs out of your lambda functions.

*Note*: This plugin supports Serverless 0.4.* 
(please use previous Releases for 0.2.* and 0.3.*)

In newer Versions of Serverless (0.5+) the functions of this plugin are already included:

 - @see http://docs.serverless.com/docs/function-configuration
 - (check the events attribute in the s-function.json file)

### Installation

 - make sure that aws and serverless are installed
 - @see http://docs.aws.amazon.com/cli/latest/userguide/installing.html
 - @see http://www.serverless.com/

 - install this plugin to your projects node_modules folder

```
cd projectfolder
npm install serverless-plugin-cronjob
```

 - add the plugin to your s-project.json file

```
"plugins": [
    "serverless-plugin-cronjob"
]
```

### Run the Plugin

 - the plugin uses a hook that is called after each deployment of a function 
 - you only have to deploy your function as usual `sls function deploy`
 - add the following attribute to the s-function.json in your functions folder

```
  ...
  "cronjob": {
    "name": "cron1",
    "description": "my fancy cronjob",    
    "enabled": false,
    "schedule": "rate(5 minutes)"
  },
  ...
```

 - Parameters:

```
name            (string)  Name of your cronjob
description     (string)  Describtion for your cronjob
enabled         (boolean) true or false, to enable or disable this cron   
schedule        (string)  defines when the cronjob should run. two different types are useable:
    a) rate(x time)         "x" is an integer number
                            "time" is a string value of "minutes", "hours" or "days"
    b) cron(0 20 * * ? *)   default crontab rules can be used

```
 
 - please check the docs for detailed descriptions https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/ScheduledEvents.html

