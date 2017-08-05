---
layout: plugin
title: Serverless Plugin Graphiql
repo: bencooling/serverless-plugin-graphiql
homepage: 'https://github.com/bencooling/serverless-plugin-graphiql'
topics: graphiql,graphql
description: A Serverless plugin to run a local http server for graphiql and your graphql handler
language: JavaScript
---


# serverless-plugin-graphiql

> Runs a local http server for graphiql and your graphql handler

[![Build Status](https://travis-ci.org/bencooling/serverless-plugin-graphiql.svg?branch=master)](https://travis-ci.org/bencooling/serverless-plugin-graphiql)
[![Coverage Status](https://coveralls.io/repos/github/bencooling/serverless-plugin-graphiql/badge.svg?branch=master)](https://coveralls.io/github/bencooling/serverless-plugin-graphiql?branch=master) [![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)
[![Npm Version](
https://img.shields.io/npm/v/serverless-plugin-graphiql.svg)](https://www.npmjs.com/package/serverless-plugin-graphiql)


## Usage
See `/example` directory for how easily it's done!  

**Steps**  
1. Create a lambda function named graphql that implements a graphql server  
2. Add `serverless-plugin-graphiql` to serverless plugins array  
3. Run `sls graphiql` command from root of serverless project  
4. Visit `localhost:8000/graphql` in your browser to use graphiql


## About  
- This plugin creates two http endpoints:  
```
GET /graphql
POST /graphql
```
- Once graphiql is running, you can also make requests via cli:
```bash
curl -X POST \
-H "Content-Type: application/json" \
-d '{"query": "{ hello }"}' \
localhost:8000/graphql
```

## Options  
```
--function -f   function name in serverless.yml for graphql handler, Default: graphql
--port -p       port for local http server to listen on, Default: 8000
```


## Requirements
- Node.js > v6.0
