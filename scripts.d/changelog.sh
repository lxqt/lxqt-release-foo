#!/bin/sh
# copyright: 2016-2017 Alf Gaida <agaida@siduction.org>
#            2016      Peter Mattern <pmattern@arcor.de>
# license: WTFPL-2

# WTFPL-2:
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
# .
# 0. You just DO WHAT THE FUCK YOU WANT TO.


changelog() {
    cd "$LOCAL_CLONE_PATH/$1/$2-$3"
    git changelog \
          --all \
          --no-merges\
          --stdout \
          --tag "$2-$3" > CHANGELOG
    git add .
    git commit -m "Release $3: Update changelog"
    git push
}
