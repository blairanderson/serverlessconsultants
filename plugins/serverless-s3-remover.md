---
layout: plugin
title: Serverless S3 Remover
repo: sinofseven/serverless-s3-remover
homepage: 'https://github.com/sinofseven/serverless-s3-remover'
description: 'A serverless plugin to make s3 buckets empty before deleting cloudformation stack when ```sls remove```'
stars: 7
stars_trend: 
stars_diff: 0
forks: 2
forks_trend: up
forks_diff: 1
watchers: 7
issues: 2
issues_trend: 
issues_diff: 0
---


[![NPM](https://nodei.co/npm/serverless-s3-remover.png?downloads=true&downloadRank=true&stars=true)](https://nodei.co/npm/serverless-s3-remover/)
[![NPM](https://nodei.co/npm-dl/serverless-s3-remover.png?height=2)](https://nodei.co/npm/serverless-s3-remover/)
# serverless-s3-remover
plugin for serverless to make buckets empty before remove

# Usage
Run next command.
```bash
$ npm install serverless-s3-remover
```

Add to your serverless.yml
```yaml
plugins:
  - serverless-s3-remover

custom:
  remover:
     buckets:
       - my-bucket-1
       - my-bucket-2
```

You can specify any number of `bucket`s that you want.

Now you can make all buckets empty by running:
```bash
$ sls s3remove
```

# When removing
When removing serverless stack, this plugin automatically make buckets empty  before removing stack.
```sh
$ sls remove
```

# Using Prompt
You can use prompt before deleting bucket.

```yaml
custom:
  remover:
    prompt: true # default value is `false`
    buckets:
      - remover-bucket-a
      - remover-bucket-b
```

![terminal.png](https://user-images.githubusercontent.com/57114/31264298-0896f1ec-aaa3-11e7-9a8e-86e3c3f34e23.png)
