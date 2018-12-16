#!/bin/sh
# copyright: 2016-2017 Alf Gaida <agaida@siduction.org>
#            2016      Peter Mattern <pmattern@arcor.de>
# license: WTFPL-2

# WTFPL-2:
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
# .
# 0. You just DO WHAT THE FUCK YOU WANT TO.


# Usage: upload "$PROJECT" "$REPO" "$TAG"
upload() {
    # upload to downloads.lxqt.org
    cd $LOCAL_ARCHIVE_PATH/$1
    UPLOAD_ARCHIVE_PATH="$UPLOAD_ARCHIVE_BASE_PATH/$1/$3"
    ssh -p $UPLOAD_ARCHIVE_PORT $UPLOAD_ARCHIVE_USER@$UPLOAD_ARCHIVE_HOST mkdir -p "$UPLOAD_ARCHIVE_PATH"
    rsync -av -e "ssh -p $UPLOAD_ARCHIVE_PORT" "$2-$3.tar.xz"* $UPLOAD_ARCHIVE_USER@$UPLOAD_ARCHIVE_HOST:$UPLOAD_ARCHIVE_PATH
}
