---
layout: plugin
title: Serverless Event Constant Inputs
repo: dittto/serverless-event-constant-inputs
homepage: 'https://github.com/dittto/serverless-event-constant-inputs'
description: 'Allows you to add constant inputs to events in Serverless 1.0. For more info see [constant values in Cloudwatch](https://aws.amazon.com/blogs/compute/simply-serverless-use-constant-values-in-cloudwatch-event-triggered-lambda-functions/)'
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


# Serverless event constant inputs

Allows you to add constant inputs to events in Serverless 1.0. This is defined in https://aws.amazon.com/blogs/compute/simply-serverless-use-constant-values-in-cloudwatch-event-triggered-lambda-functions/ .

[![Build Status](https://travis-ci.org/dittto/serverless-event-constant-inputs.svg?branch=master)](https://travis-ci.org/dittto/serverless-event-constant-inputs) [![Coverage Status](https://coveralls.io/repos/github/dittto/serverless-event-constant-inputs/badge.svg)](https://coveralls.io/github/dittto/serverless-event-constant-inputs) [![npm](https://badge.fury.io/js/serverless-event-constant-inputs.svg)](https://www.npmjs.com/package/serverless-event-constant-inputs)

## How to use

Add either a simple string as an input field to an event schedule, or an object.

```
functions:
  esi:
    handler: handler.esi
    events:
      - schedule:
          rate: cron(0 1 * * ? *)
          enabled: true
          input:
            provider: stubhub
            is_delta: true
      - schedule:
          rate: cron(0 2 * * ? *)
          enabled: true
          input: '{"provider": "see_tickets"}'
```

The above shows adding input values to 2 scheduled events. The first as an object and the second as a string.
