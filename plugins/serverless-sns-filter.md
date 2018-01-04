---
layout: plugin
title: Serverless Sns Filter
repo: MechanicalRock/serverless-sns-filter
homepage: 'https://github.com/MechanicalRock/serverless-sns-filter'
description: 'Serverless plugin to add SNS Subscription Filters to events'
stars: 5
stars_trend: 
stars_diff: 0
forks: 1
forks_trend: 
forks_diff: 0
watchers: 5
issues: 1
issues_trend: 
issues_diff: 0
---


# serverless-sns-filter

[Documentation is here](plugin/)

# Integration Testing

To run the integration test:

```
aws cloudformation create-stack --region ap-southeast-2 --stack-name sns-filter-it-setup --template-body file://integration-test/template.yml
cd plugin
yarn run setup:dev
cd ../integration-test
yarn run setup:dev
yarn run deploy:dev
cd ../plugin
yarn run test:it
```
