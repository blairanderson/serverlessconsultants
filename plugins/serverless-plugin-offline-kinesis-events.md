---
layout: plugin
title: Serverless Plugin Offline Kinesis Events
repo: DopplerLabs/serverless-plugin-offline-kinesis-events
homepage: 'https://github.com/DopplerLabs/serverless-plugin-offline-kinesis-events'
description: Plugin that works with serverless-offline to allow offline testing of serverless functions that are triggered by Kinesis events.
stars: 2
stars_trend: 
stars_diff: 0
forks: 0
forks_trend: 
forks_diff: 0
watchers: 2
issues: 0
issues_trend: 
issues_diff: 0
---


# serverless-plugin-offline-kinesis-events
[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)
[![Build Status](https://travis-ci.org/DopplerLabs/serverless-plugin-offline-kinesis-events.svg?branch=develop)](https://travis-ci.org/DopplerLabs/serverless-plugin-offline-kinesis-events)

This plugin works with [serverless-offline](https://github.com/dherault/serverless-offline) to allow offline testing of serverless functions that are triggered by Kinesis events.

## Quickstart
First, start Kinesalite:
`docker run --rm -d -p 4567:4567 dlsniper/kinesalite:1.11.4`

Then, populate Kinesalite with the appropriate streams (we add a bootstrap command for this):
```
async function ensureStream() {
  const kinesis = new AWS.Kinesis({
    endpoint: `${process.env.LAMBDA_KINESIS_HOST}:${process.env.LAMBDA_KINESIS_PORT}`,
    region: process.env.LAMBDA_REGION,
    apiVersion: '2013-12-02',
    sslEnabled: false
  })
  try {
    // Create the stream
    await kinesis.createStream({ ShardCount: 1, StreamName: process.env.LAMBDA_KINESIS_STREAM_NAME }).promise()
  } catch (err) {
    if (err.code === 'ResourceInUseException') {
      // Stream already exists, so no problem
      winston.info('Kinesis stream already exists')
      return
    }
    throw err
  }
}
```

Start your service:
`sls offline`

Finally, put records to Kinesalite (this script loads the yml to put from the first command line argument):
```
const kinesis = new AWS.Kinesis({
  endpoint: `${process.env.LAMBDA_KINESIS_HOST}:${process.env.LAMBDA_KINESIS_PORT}`,
  region: process.env.LAMBDA_REGION,
  apiVersion: '2013-12-02',
  sslEnabled: false
})

// Load the record
async function run() {
  // Read the records
  const records = await BB.all(process.argv.slice(1).map(f => readAsync(f)))
  // Write them to Kinesis
  return BB.map(records, record => kinesis.putRecord({
    Data: JSON.stringify(yaml.safeLoad(record)),
    PartitionKey: '0',
    StreamName: process.env.LAMBDA_KINESIS_STREAM_NAME
  }).promise())
}

run()
  .then(() => winston.info('Put records successfully'))
  .catch((err) => {
    winston.error(`Failed with error ${err.stack}`)
    process.exit(2)
  })
```

And you'll see your lambda fire!

## Usage in the real world
See the example/ folder for how we've used this plugin successfully in the real world.
