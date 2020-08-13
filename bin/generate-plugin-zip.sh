#!/usr/bin/env bash

cd ..
zip -FSrq poc-wordpress . -x "vendor/*" ".*" "*.md" "docker-compose*"

