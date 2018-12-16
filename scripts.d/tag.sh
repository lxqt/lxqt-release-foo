#!/bin/sh
# copyright: 2016-2017 Alf Gaida <agaida@siduction.org>
#            2016      Peter Mattern <pmattern@arcor.de>
# license: WTFPL-2

# WTFPL-2:
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
# .
# 0. You just DO WHAT THE FUCK YOU WANT TO.


tag() {
    cd "$LOCAL_CLONE_PATH/$1/$2-$3"

    # set environment variable GPG_TTY to file of current terminal
    echo 'Setting GPG_TTY to $(tty)'
    export GPG_TTY=$(tty)
    echo "Current value is: $GPG_TTY"

    # create signed tag
    git tag \
        --force \
        --sign \
        --local-user $LOCAL_USER \
        --message "Release $2 $3" $3

    # push tag
    git push --tags
}
