---
layout: plugin
title: Serverless Dynalite
repo: sdd/serverless-dynalite
homepage: 'https://github.com/sdd/serverless-dynalite'
description: Run dynalite locally (no JVM, all JS) to simulate DynamoDB. Watch serverless.yml for table config updates.
stars: 4
stars_trend: 
stars_diff: 0
forks: 4
forks_trend: 
forks_diff: 0
watchers: 4
issues: 0
issues_trend: 
issues_diff: 0
---


# serverless-dynalite

A Serverless plugin to run Dynalite locally to handle DynamoDB development. Can watch for table config changes.

Integrates with `serverless-offline`. Also works without `serverless-offline` by running

```
serverless dynalite start
```

to start dynalite with the tables specified in serverless.yml. Or:

```
serverless dynalite watch
```

to listen for changes to the serverless.yml file and add tables accordingly


## Options:

* -p `port` to specify the port (optional, defaults to 4567)
* -d `dir` to create a dynalite db file instead of using the in-memory store (optional)

Something missing? More documentation? All PRs welcome at https://github.com/sdd/serverless-dynalite
