#!/bin/sh
# copyright: 2016-2017 Alf Gaida <agaida@siduction.org>
#            2016      Peter Mattern <pmattern@arcor.de>
# license: WTFPL-2

# WTFPL-2:
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
# .
# 0. You just DO WHAT THE FUCK YOU WANT TO.


# Usage: clone "$PROJECT" "$REPO" "$TAG"
clone() {
    rm    -Rf "$LOCAL_CLONE_PATH/$1/$2"*
    mkdir -p  "$LOCAL_CLONE_PATH/$1"
    cd        "$LOCAL_CLONE_PATH/$1"
    echo 'Cloning Git repository' $GIT_ACCOUNT/$2 'to' $2-$3
    git clone $GIT_ACCOUNT/$2 $2-$3
}
