#!/usr/bin/env bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

TROJAN_GO="/etc/trojan-go"

warn() {
    now=$(date +"[%a %b %d %T %Y]")
    echo -e "${now} ${yellow}${1}${plain}"
}

error() {
    now=$(date +"[%a %b %d %T %Y]")
    echo -e "${now} ${red}${1}${plain}"   
}

log() {
    # log formatter [Tue Feb 14 03:17:50 UTC 2023]
    now=$(date +"[%a %b %d %T %Y]")
    echo "${now} ${1}"
}

issue(){

    log "I'm creating a certication. Just a minute"
    acme.sh --register-account -m ${EMAIL}
    acme.sh --issue -d ${HOST} --standalone
}

checkout(){

    acme.sh --list

    if acme.sh --list | grep -Eqi "${HOST}"; then
        log "We found the domain certification!"
        return 1
    fi
    
    warn "We can't find the domain ${HOST}'s certification"
    return 0
}


generate_config() {

mkdir ${TROJAN_GO}
cat > ${TROJAN_GO}/config.json <<EOF
{
    "run_type": "server",
    "local_addr": "0.0.0.0",
    "local_port": 443,
    "remote_addr": "127.0.0.1",
    "remote_port": 80,
    "password": [
        "${PASSWORD}"
    ],
    "ssl": {
        "cert": "server.crt",
        "key": "server.key"
    }
}
EOF
}

install_cert(){

    log "Start to install certification."

    acme.sh --install-cert -d ${HOST} \
            --key-file       ${TROJAN_GO}/server.key  \
            --fullchain-file ${TROJAN_GO}/server.crt

    return 0
}

if [[ -z ${HOST} ]]; then
   error "You must add a HOST environment variable" && exit 1
fi

log "Your Domian is ${HOST}"
log "Check Your certification..."

while checkout
do
    issue
done

install_cert
generate_config

exec "$@"