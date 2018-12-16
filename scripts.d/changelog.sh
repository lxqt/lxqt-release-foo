#!/bin/sh
# copyright: 2016-2017 Alf Gaida <agaida@siduction.org>
#            2016      Peter Mattern <pmattern@arcor.de>
# license: WTFPL-2

# WTFPL-2:
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
# .
# 0. You just DO WHAT THE FUCK YOU WANT TO.


# Usage: changelog "$PROJECT" "$REPO" "$TAG"
changelog() {
    echo "$LOCAL_CLONE_PATH/$1/$2-$3"
    cd "$LOCAL_CLONE_PATH/$1/$2-$3"
    RESULT=$(grep "$3" CHANGELOG)||$(true)
    if [ "$RESULT" ]; then
        echo "------------------------------"
        echo "Check changelog entry: $3     "
        echo "Changelog found - continue ..."
        echo "------------------------------"
    else
        echo "-------------------------------"
        echo "Check changelog entry: $3      "
        echo "Changelog not merged? Exit now!"
        echo "==============================="
        exit 1
    fi

}
