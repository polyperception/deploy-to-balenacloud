# Balena Deploy

Continuously deliver your applications to [BalenaCloud](https://www.balena.io/). Based on [push-to-balenacloud](https://github.com/polyperception/push-to-balenacloud), forked from [Balena Push](https://github.com/theaccordance/balena-push). 


## Inputs

### `api-token`

**Required**: A BalenaCloud API Token, used to authenticate with BalenaCloud.  API keys can be created in the [user settings for BalenaCloud](https://dashboard.balena-cloud.com/preferences/access-tokens).

### `application-name`

**Required**: The target application on BalenaCloud

### `application-path`

_Optional_: Provide a sub-path to the location for application being deployed to BalenaCloud.  Defaults to the workspace root.   

### `version`

_Optional_: Provide a version for the release being deployed to BalenaCloud. Defaults to 0.0.0.

### `draft`

_Optional_:Mark as draft release. Default to false

### `cache_from`

_Optional_:Comma-separated list (no spaces) of image names for build cache resolution Default is empty




## Workflow Example
```yaml
name: BalenaCloud Push

on:
  push:
    # Only run workflow for pushes to specific branches
    branches:
      - master

jobs:
  balena-push:
    runs-on: jetson-runner
    steps:
    - uses: actions/checkout@v1
    - uses: polyperception/deploy-to-balenacloud@v0.0.1
      with:
        api-token: ${{secrets.BALENA_API_TOKEN}}
        application-name: ${{secrets.BALENA_APPLICATION_NAME}}
        application-path: "./balena-wpe"
        version: 1.0.0
        cache_from: balena_edge_cicd
```