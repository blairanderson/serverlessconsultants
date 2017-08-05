---
layout: plugin
title: Serverless Plugin Include Dependencies
repo: dougmoscrop/serverless-plugin-include-dependencies
homepage: 'https://github.com/dougmoscrop/serverless-plugin-include-dependencies'
topics: 
description: This is a Serverless plugin that should make your deployed functions smaller.
---


> NOTE: This plugin could cause a `maximum call stack size exceeded` error (see https://github.com/serverless/serverless/pull/3349 for fix in Serverless)

# serverless-plugin-include-dependencies

This is a Serverless plugin that should make your deployed functions smaller.

It does this by enabling you to add your `node_modules` folder to the `exclude` list, then it individually adds each module that your handler depends on.

## Usage Example

`serverless.yml`
```yaml
service: sample

package:
  exclude:
    - node_modules/** # no need to add this yourself, this plugin does it for you

plugins:
  - serverless-plugin-include-dependencies

functions:
  foo:
    handler: src/handler/foo.handler
  bar:
    handler: src/handler/bar.handler
```

For even smaller function packages, you can also set:

```yaml
package:
  individually: true
```
But be warned: Smaller individual functions can still mean a larger overall deployment. (10 functions that are 3 MB each is more net data tranfer and storage than 1 function that is 6 MB)

## New In 2.0 - Exclusion Support

Rather than including module folders (e.g. `node_modules/foo/**`, it now includes a list of actual files (e.g. `node_modules/foo/package.json`, `node_modules/foo/index.js`) and *uses the serverless package exclude* to filter these files. Excludes *must* start with `node_modules` to be considered by this plugin.

The following examples would filter files of your module dependencies:

- `node_modules/**/README.*`
- `node_modules/**/test/**`

These would not:

- `README`
- `**/*.txt`

Even though normal matching libraries would match these rules, this library ignores them so that there's no chance of local excludes conflicting with node_modules excludes.

Unless you know exactly where dependencies will be installed (e.g. several things could depend on aws-sdk) you probably want a rule more like `node_modules/**/aws-sdk/**` (which will exclude all instances of aws-sdk) and not `node_modules/aws-sdk/**` (which would only exclude a top-level aws-sdk)
