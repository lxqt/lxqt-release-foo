#!/bin/sh
# copyright: 2016-2017 Alf Gaida <agaida@siduction.org>
#            2016      Peter Mattern <pmattern@arcor.de>
# license: WTFPL-2

# WTFPL-2:
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
# .
# 0. You just DO WHAT THE FUCK YOU WANT TO.


branch() {
    cd "$LOCAL_CLONE_PATH/$1/$2-$3"
    BRANCH_VER="$(echo "$3" | sed 's/\.[[:digit:]]*/\.x/2')"
    git checkout -b "releases-$BRANCH_VER"
    git push --set-upstream origin "releases-$BRANCH_VER:releases-$BRANCH_VER"
}
