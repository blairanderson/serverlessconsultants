---
layout: plugin
title: Serverless Offline Ssm
repo: janders223/serverless-offline-ssm
homepage: 'https://github.com/janders223/serverless-offline-ssm'
description: 'Read SSM parameters from a .env file instead of AWS'
stars: 12
stars_trend: up
stars_diff: 2
forks: 4
forks_trend: up
forks_diff: 1
watchers: 12
issues: 0
issues_trend: 
issues_diff: 0
---


# serverless-offline-ssm
[![Build Status](https://travis-ci.org/janders223/serverless-offline-ssm.svg?branch=master)](https://travis-ci.org/janders223/serverless-offline-ssm)

This [Serverless](https://github.com/serverless/serverless) plugin allows you to develop offline while using AWS SSM parameters in your `serverless.yml` template. The plugin looks for environment variables which are fulfilled by SSM parameters at build time and substitutes them from a `.env` file when running locally with the [serverless-offline plugin](https://github.com/dherault/serverless-offline).

## Documentation

- [Installation](#installation)
- [Contributing](#contributing)
- [License](#license)

## Installation

First install the plugins using npm or yarn

```bash
npm install serverless-offline serverless-offline-ssm --save-dev

#or

yarn install -D serverless-offline serverless-offline-ssm
```

Then inside of your project's `serverless.yml` file add the following to the plugins section. Note it is important that `serverless-offline-ssm` is loaded before `serverless-offline`. This is important to ensure that we are setting the variables properly for `serverless-offline` before it needs them.

```yaml
plugins:
    - serverless-offline-ssm
    - serverless-offline
```

## Contributing

Pull requests are always welcome. Please see the [contributing](https://github.com/janders223/serverless-offline-ssm/blob/master/CONTRIBUTING.md) guidelines.

## License

[MIT](https://github.com/janders223/serverless-offline-ssm/blob/master/LICENSE)
