
#!/bin/bash

helpFun()
{
    echo "Usage: $0 command"
    echo "    up: build docker image and start up docker containers"
    echo "    rm: stop and remove docker containers"
    exit 1
}

if [[ $# != 1 ]]; then
    helpFun
fi

ROOT_DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )/.." && pwd )"
export ROOT_DIR="${ROOT_DIR}"

if [[ $1 == "up" ]]; then
    docker-compose -p yixi -f "${ROOT_DIR}/docker/docker-compose.yml" up -d --build
elif [[ $1 == "rm" ]]; then
    docker-compose -p yixi -f "${ROOT_DIR}/docker/docker-compose.yml" rm -f -s
fi
