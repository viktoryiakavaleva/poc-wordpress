#!/bin/bash
set -e

. .env

###########################################################
# Functions

log() {
    echo "[${0}] [$(date +%Y-%m-%dT%H:%M:%S)] ${1}"
}

prepare_release() {
    NEW_VERSION=${1}
    if [ -z "${NEW_VERSION}" ] ; then
        log 'Missing release version!'
        return 1;
    fi

    log 'TODO Updating app version...'

    log 'Updating gitmoji-changelog version...'
    sed -i \
        -e "s|\"version\": \".*\"|\"version\": \"${NEW_VERSION}\"|g" \
        ./.gitmoji-changelogrc

    # Generate Changelog for version
    log "Generating Changelog for version '${NEW_VERSION}'..."
    npm install
    npm run gitmoji-changelog

    # TODO Add and commit to git with message `:bookmark: Release X.Y.Z`
}

usage() {
    echo "usage: ./manage.sh COMMAND [ARGUMENTS]

    Commands:
        prepare-release     Prepare Frappe app release
    "
}

###########################################################
# Runtime

case "${1}" in
    # DEV env
    prepare-release) prepare_release ${@:2};;
    # Help
    *) usage;;
esac

exit 0
