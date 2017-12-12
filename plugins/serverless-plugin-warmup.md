---
layout: plugin
title: Serverless Plugin Warmup
repo: FidelLimited/serverless-plugin-warmup
homepage: 'https://github.com/FidelLimited/serverless-plugin-warmup'
description: 'Keep your lambdas warm during Winter.'
stars: 109
stars_trend: up
stars_diff: 4
forks: 19
forks_trend: 
forks_diff: 0
watchers: 109
issues: 7
issues_trend: 
issues_diff: 0
---


Serverless WarmUP Plugin ♨
=============================
[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)
[![npm version](https://badge.fury.io/js/serverless-plugin-warmup.svg)](https://badge.fury.io/js/serverless-plugin-warmup)
[![npm downloads](https://img.shields.io/npm/dm/serverless-plugin-warmup.svg)](https://www.npmjs.com/package/serverless-plugin-warmup)
[![license](https://img.shields.io/npm/l/serverless-plugin-warmup.svg)](https://raw.githubusercontent.com/FidelLimited/serverless-plugin-warmup/master/LICENSE)

Keep your lambdas warm during Winter.

**Requirements:**
* Serverless *v1.12.x* or higher.
* AWS provider

## How it works

WarmUP solves *cold starts* by creating one schedule event lambda that invokes all the service lambdas you select in a configured time interval (default: 5 minutes) or a specific time, forcing your containers to stay alive.

## Setup

 Install via npm in the root of your Serverless service:
```
npm install serverless-plugin-warmup --save-dev
```

* Add the plugin to the `plugins` array in your Serverless `serverless.yml`:

```yml
plugins:
  - serverless-plugin-warmup
```

* Add a `warmup` property to all functions you want to be warm.

You can enable WarmUp in general:

```yml
functions:
  hello:
    warmup: true
```

For a specific stage:

```yml
functions:
  hello:
    warmup: production
```

For several stages:

```yml
functions:
  hello:
    warmup:
      - production
      - staging
```
* WarmUP to be able to `invoke` lambdas requires the following Policy Statement in `iamRoleStatements`:

```yaml
iamRoleStatements:
  - Effect: 'Allow'
    Action:
      - 'lambda:InvokeFunction'
    Resource:
    - Fn::Join:
      - ':'
      - - arn:aws:lambda
        - Ref: AWS::Region
        - Ref: AWS::AccountId
        - function:${self:service}-${opt:stage, self:provider.stage}-*
```
If using pre-warm, the deployment user also needs a similar policy so it can run the WarmUp lambda.

* Add an early callback call when the event source is `serverless-plugin-warmup`. You should do this early exit before running your code logic, it will save your execution duration and cost:

```javascript
module.exports.lambdaToWarm = function(event, context, callback) {
  /** Immediate response for WarmUP plugin */
  if (event.source === 'serverless-plugin-warmup') {
    console.log('WarmUP - Lambda is warm!')
    return callback(null, 'Lambda is warm!')
  }

  ... add lambda logic after
}
```

* All done! WarmUP will run on SLS `deploy` and `package` commands

## Options

* **cleanFolder** (default `true`)
* **memorySize** (default `128`)
* **name** (default `${service}-${stage}-warmup-plugin`)
* **schedule** (default `rate(5 minutes)`) - More examples [here](https://docs.aws.amazon.com/lambda/latest/dg/tutorial-scheduled-events-schedule-expressions.html).
* **timeout** (default `10` seconds)
* **prewarm** (default `false`)
* **folderName** (default `_warmup`)

```yml
custom:
  warmup:
    cleanFolder: false,
    memorySize: 256
    name: 'make-them-pop'
    schedule: 'cron(0/5 8-17 ? * MON-FRI *)' // Run WarmUP every 5 minutes Mon-Fri between 8:00am and 5:55pm (UTC)
    timeout: 20
    prewarm: true // Run WarmUp immediately after a deployment
    folderName: '_warmup' // Name of the folder created for the generated warmup lambda
```

**Options should be tweaked depending on:**
* Number of lambdas to warm up
* Day cold periods
* Desire to avoid cold lambdas after a deployment

**Lambdas invoked by WarmUP will have event source `serverless-plugin-warmup`:**

```json
{
  "Event": {
    "source": "serverless-plugin-warmup"
  }
}
```

## Artifact

If you are doing your own [package artifact](https://serverless.com/framework/docs/providers/aws/guide/packaging#artifact) set option `cleanFolder` to `false` and run `serverless package`. This will allow you to extract the `warmup` NodeJS lambda file from the `_warmup` folder and add it in your custom artifact logic.

## Gotchas

If you are deploying to a VPC, you need to use private subnets with a Network Address Translation (NAT) gateway (http://docs.aws.amazon.com/lambda/latest/dg/vpc.html). WarmUp requires this so it can call the other lambdas but this is applicable to any lambda that needs access to the public internet or to any other AWS service.

## Cost

Lambda pricing [here](https://aws.amazon.com/lambda/pricing/). CloudWatch pricing [here](https://aws.amazon.com/cloudwatch/pricing/). You can use [AWS Lambda Pricing Calculator](https://s3.amazonaws.com/lambda-tools/pricing-calculator.html) to check how much will cost you monthly.

#### Example

Free Tier not included + Default WarmUP options + 10 lambdas to warm, each with `memorySize = 1024` and `duration = 10`:
* WarmUP: runs 8640 times per month = $0.18
* 10 warm lambdas: each invoked 8640 times per month = $14.4
* Total = $14.58

CloudWatch costs are not in this example because they are very low.

## Contribute

Help us making this plugin better and future proof.

* Clone the code
* Install the dependencies with `npm install`
* Create a feature branch `git checkout -b new_feature`
* Lint with standard `npm run lint`

## License

This software is released under the MIT license. See [the license file](LICENSE) for more details.
