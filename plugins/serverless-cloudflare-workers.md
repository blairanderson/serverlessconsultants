---
layout: plugin
title: Serverless Cloudflare Workers
repo: cloudflare/serverless-cloudflare-workers
homepage: 'https://github.com/cloudflare/serverless-cloudflare-workers'
description: 'A serverless plugin allowing you to integrate with [Cloudflare Workers](https://cloudflareworkers.com/#12a9195720fe4ed660949efdbd9c0219:https://tutorial.cloudflareworkers.com)'
stars: 18
stars_trend: 
stars_diff: 0
forks: 8
forks_trend: 
forks_diff: 0
watchers: 18
issues: 1
issues_trend: 
issues_diff: 0
---


# serverless-cloudflare-workers

Serverless plugin for [Cloudflare Workers](https://developers.cloudflare.com/workers/)

## Documentation

https://serverless.com/framework/docs/providers/cloudflare/guide/quick-start/

### Bundling with Webpack

You can have the plugin automatically bundle your code into one file using [webpack](https://webpack.js.org/). This is a great solution if you are fine with a no frills bundling.

Simply add `webpack: true` to your config block.

```yaml
functions:
  myfunction:
    name: myfunction
    webpack: true
    script: handlers/myfunctionhandler
    events:
      - http:
          url: example.com/myfunction
          method: GET
  
```

### Using Cloudflare KV Storage

The plugin can create and bind a [KV Storage](https://developers.cloudflare.com/workers/kv/) namespace for your function by simpling adding a resources section.

The following will create a namespace called `BEST_NAMESPACE` and bind the variable `TEST` to that namespace inside `myfunction`.

```yaml
functions:
  myfunction:
    name: myfunction
    webpack: true
    script: handlers/myfunctionhandler
    resources:
      kv:
        - variable: TEST
          namespace: BEST_NAMESPACE
    events:
      - http:
          url: example.com/myfunction
          method: GET
```
