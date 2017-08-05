---
layout: plugin
title: Serverless Dynalite
repo: sdd/serverless-dynalite
homepage: 'https://github.com/sdd/serverless-dynalite'
topics: 
description: Run dynalite locally (no JVM, all JS) to simulate DynamoDB. Watch serverless.yml for table config updates.
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

Something missing? More documentation? All PRs welcome at https://github.com/sdd/serverless-dynalite
