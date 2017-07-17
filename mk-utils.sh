#!/bin/sh

SOURCE="https://github.com/whosonfirst/go-whosonfirst-brands/archive/master.zip"
DEST="go-whosonfirst-brands-master"

GO=`which go`
CURL=`which curl`
UNZIP=`which unzip`

if [ ! -e ${GO} ]
then
    echo "You must have Go installed in order for this to work."
    exit 1
fi

if [ -e ${DEST}.zip ]
then
    rm ${DEST}.zip
fi

if [ -e ${DEST} ]
then
    rm -rf ${DEST}
fi

${CURL} -o ${DEST}.zip -L ${SOURCE}
${UNZIP} ${DEST}.zip

cd ${DEST}

for OS in darwin linux windows
do
    rm -rf bin/*

    # https://dave.cheney.net/2015/08/22/cross-compilation-with-go-1-5
    export GOOS=${OS}
    export GOARCH=386

    make bin

    if [ ! -d ../utils/${OS} ]
    then
	mkdir ../utils/${OS}
    fi

    cp bin/* ../utils/${OS}
done

cd -

rm ${DEST}.zip
rm -rf ${DEST}

exit 0
