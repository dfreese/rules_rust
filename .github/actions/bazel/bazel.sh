#!/bin/bash -eux

if [[ -n "${INPUT_ARGUMENTS:-""}" ]]; then
  INPUT_COMMAND+=(" ${INPUT_ARGUMENTS}")
fi

apt-get install -y "bazel-${INPUT_VERSION}"

if [[ -n "${INPUT_DIRECTORY:-""}" ]]; then
  cd "${INPUT_DIRECTORY}"
fi

if [[ -n "${INPUT_TARGETS:-""}" ]]; then
  INPUT_TARGETS="//..."
fi
if [[ -n "${INPUT_QUERY:-""}" ]]; then
  INPUT_TARGETS=$("bazel-${INPUT_VERSION}" query -- "${INPUT_QUERY}")
fi

# leave targets unquoted to allow multi-line query output to be a single-line
# input here.
"bazel-${INPUT_VERSION}" "${INPUT_COMMAND}" -- ${INPUT_TARGETS}
