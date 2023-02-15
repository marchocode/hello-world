#!/usr/bin/env bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

CERT_DIR="/etc/nginx/cert"

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

checkout(){
    if acme.sh --list | grep -Eqi "${HOST}"; then

        log "We found the domain certification!"
        return 0
    fi
    
    warn "We can't find the domain ${HOST}'s certfication"
    return 1
}

issue(){
    acme.sh --issue -d ${HOST} --standalone
}

install(){

    log "Start to install certificaion."
    mkdir -p ${CERT_DIR}

    acme.sh --install-cert -d ${HOST} \
            --key-file       ${CERT_DIR}/acme.key  \
            --fullchain-file ${CERT_DIR}/acme.crt
}

if [[ -z ${HOST} ]]; then
   error "You must add a HOST environment variable" && exit 1
fi

log "Your Domian is ${HOST}"
log "Check Your certification..."

checkout

if [ $? == 1 ]; then
    log "Now. we need to issue a cert."
    issue
fi

log "Check certification again.."
acme.sh --list

install

exec "$@"