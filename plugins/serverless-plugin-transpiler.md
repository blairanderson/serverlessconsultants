---
layout: plugin
title: Serverless Plugin Transpiler
repo: medikoo/serverless-plugin-transpiler
homepage: 'https://github.com/medikoo/serverless-plugin-transpiler'
description: 'Transpile lambda files during packaging step'
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


# serverless-plugin-transpiler
## Transpile lambda files during packaging step
## Plugin for Serverless v1+

Register a transpiler function which will serve as a file content transformer before they land in lambda package.

### Installation

	$ npm install serverless-plugin-transpiler

### Configuration (within `serverless.yml`)

1. Activate plugin in `serverless.yml`

```yaml
plugins:
  - serverless-plugin-transpiler
```

2. Configure _transpiler_ module, it should reside somewhere within your service.

_Transpiler_ should be a function that on `content` (file contents) and `filePath` (full path to module)
returns transpiled (if needed) content. Handling is as follows:

- Transpiler may be sync (return transpiled code directly) or async (may return promise)
- If resolved value from transpiler is either `null` or `undefined` then it is assumed that no transpilation 
was applied to this file, and original file content is passed as it is.

Example transpiler:

```javascript
module.exports = function (content, filePath) {
	if (!filePath.endsWith(".js")) return null; // transpile only JS files

	return transpileES2019Feature(content);
}
```

3. Configure path to preconfigured transpiler in `serverless.yml`

```yaml
custom:
  transpilerPath: lib/transpile.js
```
