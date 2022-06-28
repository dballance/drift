#!/bin/bash
set -e

function generate() {
    echo "------------- Generate: $1 -------------"
    pushd $1 > /dev/null
    rm -rf .dart_tool
    dart pub get
    dart run build_runner build --delete-conflicting-outputs
    popd > /dev/null
}

cd ..
generate 'drift'
generate 'drift_dev'
generate 'docs'
generate 'extras/benchmarks'
generate 'extras/integration_tests/drift_testcases'
generate 'extras/integration_tests/web'
generate 'examples/app'
generate 'examples/flutter_web_worker_example'
generate 'examples/migrations_example'
generate 'examples/web_worker_example'
generate 'examples/with_built_value'