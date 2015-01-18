#!/bin/bash
for d in bundle/*; do
    pushd .
    pushd "$d" && git pull
    popd
done
