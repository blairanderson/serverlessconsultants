---
layout: plugin
title: Serverless Tesseract
repo: Suor/serverless-tesseract
homepage: 'https://github.com/Suor/serverless-tesseract'
description: 'Add Tesseract OCR Engine to your build.'
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


# Serverless Tesseract plugin

A Serverless plugin to easily add Tesseract OCR engine to your deployment. Builds tesseract for you in a docker container.


## Installation and Configuration

```
npm install --save serverless-tesseract
```

Add the plugin to your `serverless.yml` file and configure:

```yaml
plugins:
  - serverless-tesseract

custom:
  # This section is optional, as well as all of its keys.
  # Defaults are shown in the example.
  tesseract:
    version: 4.0.0
    leptonica_version: 1.76.0
    tessdata: "osd eng" # Add any other languages rus, deu, ...
    tessdata_url: https://github.com/tesseract-ocr/tessdata/raw/master/
    # Other obvious choices are:
    #   https://github.com/tesseract-ocr/tessdata_fast/raw/master/
    #   https://github.com/tesseract-ocr/tessdata_best/raw/master/
    # The fast ones are used by Ubuntu and Debian by default
```

Then run `sls deploy` or `sls package` as usual.


## Usage

This plugins adds `tesseract-standalone` directory to your build with its executable, libs and tessdata and convenience script `tesseract` to the root of your project. You may call it directly or add it to path:

```python
LAMBDA_TASK_ROOT = os.environ.get('LAMBDA_TASK_ROOT',
                                  os.path.dirname(__file__))
os.environ["PATH"] = LAMBDA_TASK_ROOT + os.pathsep + os.environ['PATH']
```


## Commands

This plugin defines commands to manufacture and clean artifacts without packaging them:

```bash
sls tesseract create
sls tesseract clean
```

Note that this plugin uses (Docker Artifacts)[https://github.com/Suor/serverless-docker-artifacts] plugin to function, so you can use that to clean up docker containers and images used to build tesseract:

```bash
sls dockart clean-docker
```

You need to add `serverless-docker-artifacts` to your plugins first though.
