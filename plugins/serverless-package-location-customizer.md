---
layout: plugin
title: Serverless Package Location Customizer
repo: cipri-p/serverless-package-location-customizer
homepage: 'https://github.com/cipri-p/serverless-package-location-customizer'
description: 'A serverless plugin to allow custom S3Bucket and S3Key path when packaging Lambda Functions and Layers.'
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


# serverless-package-location-customizer

[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)
[![npm](https://img.shields.io/npm/v/serverless-package-location-customizer.svg)](https://www.npmjs.com/package/serverless-package-location-customizer)
[![license](https://img.shields.io/npm/l/serverless-package-location-customizer.svg)]()


A serverless plugin to allow custom S3Bucket and S3Key path when packaging Lambda Functions and Layers

## Installation

Install to your Serverless project via npm

```bash
$ npm install --save serverless-package-location-customizer
```

## Usage

Add the plugin to your `serverless.yml`

```yaml
# serverless.yml

plugins:
  - serverless-package-location-customizer
```

Run serverless package command with the following paramters

* _--s3-bucket_ name of the deployment bucket
* _--s3-path_ path to the packaged inside the deployment bucket

## Example

```bash
serverless package --stage production --s3-bucket my-deployment-packages --s3-path /my-product/v1.2.3-45/
```
