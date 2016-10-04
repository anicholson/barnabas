#!/bin/bash

mkdir -p build
crystal deps fetch
crystal build src/barnabas.cr -o build/barnabas
