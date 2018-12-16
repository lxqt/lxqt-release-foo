#!/bin/sh
# copyright: 2016-2017 Alf Gaida <agaida@siduction.org>
#            2016      Peter Mattern <pmattern@arcor.de>
# license: WTFPL-2

# WTFPL-2:
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
# .
# 0. You just DO WHAT THE FUCK YOU WANT TO.


archive() {
    rm    -Rf "$LOCAL_ARCHIVE_PATH/$1/$2"*
    mkdir -p  "$LOCAL_ARCHIVE_PATH/$1"
    cd        "$LOCAL_CLONE_PATH/$1/$2-$3"

    # create format tar.xz in terms of 'git archive'
    git config tar.tar.xz.command "xz -c"

    # create tarball
    git archive -v -9 \
        --format tar.xz \
        --prefix "$2-$3/" \
        HEAD \
        --output "$LOCAL_ARCHIVE_PATH/$1/$2-$3.tar.xz"

    # verification (GPG signature, SHA256 hashes)
    cd $LOCAL_ARCHIVE_PATH/$1
    gpg --local-user $LOCAL_USER --armor --detach-sign "$2-$3.tar.xz"
    sha256sum "$2-$3.tar.xz" > "$2-$3.tar.xz".sha256
}
