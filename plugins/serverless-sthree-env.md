---
layout: plugin
title: Serverless Sthree Env
repo: StyleTributeIT/serverless-sthree-env
homepage: 'https://github.com/StyleTributeIT/serverless-sthree-env'
description: 'Serverless plugin to get config from a json formatted file in S3 and copy them to environment variable'
stars: 2
stars_trend: 
stars_diff: 0
forks: 1
forks_trend: 
forks_diff: 0
watchers: 2
issues: 0
issues_trend: 
issues_diff: 0
---


# STHREE ENV PLUGIN
This plugin is used to get config from a json formatted file in S3 and copy them to environment variable

## HOW TO USE

- just include 'serverless-sthree-env' plugin to your serverless yml file

For now it is quite simple, the bucket and config key name is predefined based on

Bucket: (service name)-config-(stage)
Key: config.json

everything in that key will be copied over to your environment variable

eg. service name is my-apps and I am using dev stage

so create a bucket in the same region with the name my-apps-config-dev and config.json file inside there like below
```
{
  "KEY": "VALUE" 
}
```

### FUTURE IMPROVEMENT

- Create serverless command to create a config bucket 
- Allow selection of config bucket and key
- Whitelist or blacklist env variable to be copied



      



