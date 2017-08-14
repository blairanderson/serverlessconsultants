---
layout: plugin
title: Serverless Plugin Stack Outputs
repo: svdgraaf/serverless-plugin-stack-outputs
homepage: 'https://github.com/svdgraaf/serverless-plugin-stack-outputs'
description: Displays stack outputs for your serverless stacks when `sls info` is ran
stars: 7
stars_trend: 
stars_diff: 0
forks: 1
forks_trend: 
forks_diff: 0
watchers: 7
issues: 1
issues_trend: 
issues_diff: 0
---


# serverless-plugin-stack-outputs
Displays stack outputs for your serverless stacks

# Installation
Install the package:
```bash
npm install serverless-plugin-stack-outputs
```

Add it to your plugin list in `serverless.yml`:

```yaml
plugins:
  - serverless-plugin-stack-outputs
```

And it will automagically work.

# Usage
Whenever you call `info` or `deploy` with the `--verbose` option, the stack outputs will be appended:

```bash
sls info --verbose
sls deploy --verbose
```

You can also get just the stack outputs directly via:
```bash
sls info outputs
```

# Example
![Example](https://raw.githubusercontent.com/svdgraaf/serverless-plugin-stack-outputs/master/docs/example.gif)
