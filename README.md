Starting the instance
=====================

> export OPENGROK_BASE=/Users/andrewlongstaffe/opengrok

> docker run -d \
    -v $OPENGROK_BASE/src:/src \
    -v $OPENGROK_BASE/docker-instance:/data \
    -v $OPENGROK_BASE/docker-config/opengrok.cfg:/etc/opengrok.cfg \
    -v $OPENGROK_BASE/docker-bin/OpenGrok:/opengrok-0.12.1.5/bin/OpenGrok \
    -p 8888:8080 \
    --name og \
    scue/docker-opengrok

To index stuff
> docker exec -i /bin/bash -c "OPENGROK_CONFIGURATION=/etc/opengrok.cfg /opengrok-0.12.1.5/bin/OpenGrok update"

To update sources
host:
> scripts/update_repos.sh

Docker stuff
============

Attach doesnt seem to work? Instead use:
> docker exec -it og /bin/bash

Run commands
> docker exec og ls

> docker exec -i og /bin/bash -c "ls"

Locally
=======

Use a conf file:
> OPENGROK_CONFIGURATION=/etc/opengrok.cfg /opengrok-0.12.1.5/bin/OpenGrok update

-d or -rm

Docs 
====

https://hub.docker.com/r/scue/docker-opengrok/

https://github.com/scue/docker-opengrok

To Do
=====

1) Install git, so history etc works

> apt-get update && apt-get install git

** Add this to docker image
** Find how to restart webserver... (to test git more easily)

2) Rename docker-instance to og-data
3) Look at how to secure webapp (if needed)

Notes
========

* Search is available at http://localhost:8888/src
* If you see index corruption type errors, then the easiest solution is wipe out the DATA-ROOT folder. ie - $OPENGROK_BASE/docker-instance
* index = update