#!/bin/bash
set -e

docker build -t ros2-test -f test/Dockerfile .
docker run --rm ros2-test ansible-playbook -i localhost, playbook.yml --syntax-check
echo "Test passed"