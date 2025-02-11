#!/bin/bash -o pipefail

EXTRA_ARGS=""

if [[ "${DRAFT}" == "true" ]]; then
  EXTRA_ARGS="--draft"
fi
if [[ -n "${CACHE_FROM}" ]]; then
  EXTRA_ARGS="${EXTRA_ARGS} --cache-from ${CACHE_FROM}"
fi

cd ${GITHUB_WORKSPACE} && \
  cd ${APPLICATION_PATH} && \
  echo -e "name: ${APPLICATION_NAME}\ntype: sw.application\nversion: ${VERSION}" > balena.yml && \
  /balena-cli/balena login --token ${API_TOKEN} && \
  /balena-cli/balena deploy ${APPLICATION_NAME} --build ${EXTRA_ARGS} | grep -v \\[=*\>

