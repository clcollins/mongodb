#!/usr/bin/env bash

set -o errexit

IMAGE="mongodb"
DISTROS=("centos" "ubuntu")
PROJECT="stingar"

TAG="$(git describe --tags)"

for distro in ${DISTROS[@]}
do
  docker build -t ${PROJECT}/${IMAGE}:${TAG}-${distro} -f Dockerfile-${distro} . >> /dev/null
  echo docker push ${PROJECT}/${IMAGE}:${TAG}-${distro}
done

docker tag ${PROJECT}/${IMAGE}:${TAG}-${DISTROS[0]} ${PROJECT}/${IMAGE}:latest >> /dev/null
echo docker push ${PROJECT}/${IMAGE}:latest
