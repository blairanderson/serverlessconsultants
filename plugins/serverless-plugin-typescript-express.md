---
layout: plugin
title: Serverless Plugin Typescript Express
repo: eliasjcjunior/serverless-plugin-typescript-express
homepage: 'https://github.com/eliasjcjunior/serverless-plugin-typescript-express'
description: 'Serverless plugin Typescript support with express integration'
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


# Serverless Plugin Typescript Express

[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)

## Features

   * Integrates with serverless-offline (live reload without restart server)
   * It's not necessary complementary configuration

## Instalation and use

```sh
yarn add --dev serverless-plugin-typescript-express
```
or
```
npm install --save-dev serverless-plugin-typescript-express
```

Add the following plugin to your `serverless.yml`:

```yaml
plugins:
  - 'serverless-plugin-typescript-express'
```

### `tsconfig.json`

The default `tsconfig.json` file used by the plugin looks like this:

```json
{
    "compilerOptions": {
      "target": "es6",
      "module": "commonjs",
      "outDir": "dist",
      "sourceMap": true,
      "experimentalDecorators": true,
      "emitDecoratorMetadata": true,
      "isolatedModules": false,      
      "lib": [ 
        "es6", 
        "dom" 
      ]
    },
    "include": [
      "src/**/*"
    ],
    "exclude": [
      "node_modules"
    ]
  } 
```

### The input folder src cannot be overwritten
License
----
MIT

   [serverless-plugin-typescript]: https://github.com/hewmen/serverless-plugin-typescript
