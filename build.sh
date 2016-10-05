#!/bin/bash

mkdir -p build
crystal deps update
crystal build src/barnabas.cr -o build/barnabas
