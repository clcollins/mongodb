#This repository is archived and will no longer receive updates.

MongoDB
=======

*Community Honey Network MongoDB service*

| branch | build status |
| ---    | ---          |
| master | [![Master Build Status](https://travis-ci.org/CommunityHoneyNetwork/mongodb.svg?branch=master)](https://travis-ci.org/CommunityHoneyNetwork/mongodb) |
| staging | [![Staging Build Status](https://travis-ci.org/CommunityHoneyNetwork/mongodb.svg?branch=staging)](https://travis-ci.org/CommunityHoneyNetwork/mongodb) |

Ansible playbook and Dockerfile for setting up a MongoDB instance, containerized or not, for use with CHN projects.

## Requirements

Containerized usage:

* docker
* docker-compose

Stand-alone:

* ansible

## Building and Running the container

Build:

    docker build -t mongodb .

Run with:

    docker run -p 27017:27017 \
               --name mongodb \
	       -v <host_logdir>:/var/log/mongodb \
	       -v <host_datadir>:/var/lib/mongo \
	       -d <image-name>

The container supports numactl, but it's disabled in the mongod.run file.  Enable it if needed.
