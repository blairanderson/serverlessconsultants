---
layout: plugin
title: Serverless Dynamodb Autoscaler
repo: EndemolShineGroup/serverless-dynamodb-autoscaler
homepage: 'https://github.com/EndemolShineGroup/serverless-dynamodb-autoscaler'
description: 'Autoscale DynamoDB resources with a single AWS AutoScalingPlan'
stars: 0
stars_trend: 
stars_diff: 0
forks: 0
forks_trend: 
forks_diff: 0
watchers: 0
issues: 8
issues_trend: 
issues_diff: 0
---


![Banner][icon-banner]

[![MIT Licensed][icon-license]][link-license]
[![NPM Version][icon-npm]][link-npm]
[![Build Status][icon-ci]][link-ci]
[![Greenkeeper Status][icon-greenkeeper]][link-greenkeeper]

[![Code Issues][icon-issues]][link-issues]
[![Codebase Maintainability][icon-maintainability]][link-maintainability]
[![Test Coverage][icon-coverage]][link-coverage]
[![Jest][icon-jest]][link-jest]

[![Commitizen][icon-commitizen]][link-commitizen]
[![Semantic Release][icon-semantic-release]][link-semantic-release]
[![Prettier][icon-prettier]][link-prettier]

Autoscale DynamoDB resources with a single AWS AutoScalingPlan

## Installation

```bash
yarn add -D @endemolshinegroup/serverless-dynamodb-autoscaler
```

## Usage

Add the plugin to your `serverless.yml`:

```yaml
plugins:
  - @endemolshinegroup/serverless-dynamodb-autoscaler
```

## Configuration

Add a `capacities` property to your `serverless.yml`:

```yaml
custom:
  capacities:
    - table: CustomTable  # DynamoDB Resource
      index:              # List or single index name
        - custom-index-name
      read:
        minimum: 5        # Minimum read capacity
        maximum: 1000     # Maximum read capacity
        usage: 0.75       # Targeted usage percentage
      write:
        minimum: 40       # Minimum write capacity
        maximum: 200      # Maximum write capacity
        usage: 0.5        # Targeted usage percentage
```

Finish by running `sls deploy` and you're good to go!

[icon-banner]: docs/assets/banner.png

[icon-license]: https://img.shields.io/github/license/EndemolShineGroup/serverless-dynamodb-autoscaler.svg?longCache=true&style=flat-square
[link-license]: LICENSE
[icon-npm]: https://img.shields.io/npm/v/@endemolshinegroup/serverless-dynamodb-autoscaler.svg?longCache=true&style=flat-square
[link-npm]: https://www.npmjs.com/package/@endemolshinegroup/serverless-dynamodb-autoscaler
[icon-ci]: https://img.shields.io/travis/com/EndemolShineGroup/serverless-dynamodb-autoscaler.svg?longCache=true&style=flat-square
[link-ci]: https://travis-ci.com/EndemolShineGroup/serverless-dynamodb-autoscaler
[icon-greenkeeper]: https://img.shields.io/badge/greenkeeper-enabled-brightgreen.svg?longCache=true&style=flat-square
[link-greenkeeper]: https://greenkeeper.io/

[icon-issues]: https://img.shields.io/codeclimate/issues/EndemolShineGroup/serverless-dynamodb-autoscaler.svg?longCache=true&style=flat-square
[link-issues]: https://codeclimate.com/github/EndemolShineGroup/serverless-dynamodb-autoscaler/issues
[icon-maintainability]: https://img.shields.io/codeclimate/maintainability/EndemolShineGroup/serverless-dynamodb-autoscaler.svg?longCache=true&style=flat-square
[link-maintainability]: https://codeclimate.com/github/EndemolShineGroup/serverless-dynamodb-autoscaler
[icon-coverage]: https://img.shields.io/codecov/c/github/EndemolShineGroup/serverless-dynamodb-autoscaler/develop.svg?longCache=true&style=flat-square
[link-coverage]: https://codecov.io/gh/EndemolShineGroup/serverless-dynamodb-autoscaler

[icon-jest]: https://img.shields.io/badge/tested_with-jest-99424f.svg?longCache=true&style=flat-square
[link-jest]: https://jestjs.io/

[icon-commitizen]: https://img.shields.io/badge/commitizen-friendly-brightgreen.svg?longCache=true&style=flat-square
[link-commitizen]: http://commitizen.github.io/cz-cli/
[icon-semantic-release]: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg?longCache=true&style=flat-square
[link-semantic-release]: https://semantic-release.gitbooks.io/semantic-release/
[icon-prettier]: https://img.shields.io/badge/code_style-prettier-ff69b4.svg?longCache=true&style=flat-square
[link-prettier]: https://prettier.io/

