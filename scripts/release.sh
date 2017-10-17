#!/bin/sh
# copyright: 2016-2017 Alf Gaida <agaida@siduction.org>
#            2016      Peter Mattern <pmattern@arcor.de>
# license: WTFPL-2

# WTFPL-2:
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
# .
# 0. You just DO WHAT THE FUCK YOU WANT TO.

clone() {
    rm    -Rf "$LOCAL_CLONE_PATH/$1/$2"*
    mkdir -p  "$LOCAL_CLONE_PATH/$1"
    cd        "$LOCAL_CLONE_PATH/$1"
    echo 'Cloning Git repository' $GIT_ACCOUNT/$2 'to' $2-$3
    git clone $GIT_ACCOUNT/$2 $2-$3
}

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

branch() {
    cd "$LOCAL_CLONE_PATH/$1/$2-$3"
    BRANCH_VER="$(echo "$3" | sed 's/\.[[:digit:]]*/\.x/2')"
    git checkout -b "releases-$BRANCH_VER"
    git push --set-upstream origin "releases-$BRANCH_VER:releases-$BRANCH_VER"
}

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

    # upload to downloads.lxqt.org
    UPLOAD_ARCHIVE_PATH="$UPLOAD_ARCHIVE_BASE_PATH/$1/$3"
    ssh $UPLOAD_ARCHIVE_USER@$UPLOAD_ARCHIVE_HOST mkdir -p "$UPLOAD_ARCHIVE_PATH"
    rsync -av "$2-$3.tar.xz"* $UPLOAD_ARCHIVE_USER@$UPLOAD_ARCHIVE_HOST:$UPLOAD_ARCHIVE_PATH/

    # upload to github
    # go-script?
}
