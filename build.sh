#!/bin/bash

echo "Checking for dependencies"

if [[ -z `which crystal` ]]; then
    echo "you need Crystal for Barnabas to work"
    brew install crystal-lang
else
    echo "Crystal found: "
    crystal -v
fi

if [[ -z `which sqlite3` ]]; then
    echo "you need SQLite3 for Barnabas to work"
    brew install sqlite3
else
    echo "SQLite3 found: "
    sqlite3 --version
fi

mkdir -p build
crystal deps update
crystal build src/barnabas.cr -o build/barnabas --error-trace
