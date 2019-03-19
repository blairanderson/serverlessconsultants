---
layout: plugin
title: Serverless Fargate Tasks
repo: svdgraaf/serverless-fargate-tasks
homepage: 'https://github.com/svdgraaf/serverless-fargate-tasks'
description: 'A plugin to run fargate tasks as part of your Serverless project'
stars: 4
stars_trend: 
stars_diff: 0
forks: 2
forks_trend: 
forks_diff: 0
watchers: 4
issues: 2
issues_trend: 
issues_diff: 0
---


Serverless Fargate Tasks
------------------------
This Serverless plugin will setup a Fargate cluster and setup services and tasks.
With this plugin it's fairly easy to setup a (long running) task which would hook up to kinesis streams or SQS endpoints.

The (minimal) config is as follows:

```
custom:
  fargate:
    network:
      subnets:
        - subnet-1234
        - subnet-5678

    tasks:
      my-task:
        image: 123456789369.dkr.ecr.eu-west-1.amazonaws.com/my-image
```

Of course, you can customize to your hearts desire, here are all the available options:

```
custom:
  fargate:
    # you can put global environment variables here, these will be added
    # to all tasks. Optional of course.
    environment:
      foo: bar

    # you can set the execution role that will be used, this will default to the default
    # role for your account
    role: arn:aws:iam::123456789369:role/ecsTaskExecutionRole

    network:
      public-ip: DISABLED  # optional, defaults to disabled
      subnets:
        - subnet-1234
        - subnet-5678
      security-groups:  # optional, defaults to vpc default
        - sg-123456678

    tasks:
      my-task:
        image: 123456789369.dkr.ecr.eu-west-1.amazonaws.com/my-image
        environment:  # optional
          platypus: true
          # local variables will always override global ones
          foo: wut
        cpu: 512  # optional, defaults to 25% -> 256, see cloudformation docs for valid values
        memory: 1GB  # optional, defaults to 0.5GB
```

Advanced usage
--------------
You can override the generated CF resource properties per task with the `override` properties:

```
custom:
  fargate:
    tasks:
      my-task:
        image: 123456789369.dkr.ecr.eu-west-1.amazonaws.com/my-image

        # these are all optional
        override:
          task:
            Foo: BAR
          container:
            Foo: Bar
          service:
            Foo: BAR
          network:
            Foo: BAR
          role: ARN
```
