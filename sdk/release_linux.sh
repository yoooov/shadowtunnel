#/bin/bash
VERSION=$(cat ../VERSION)
VER="${VERSION}_$(date '+%Y%m%d%H%M%S')"
X="-X github.com/yoooov/shadowtunnel/core.VERSION=$VER"
TRIMPATH1="${GOPATH}/src/github.com/snail007"
TRIMPATH=$(dirname ~/go-workspace/src/github.com/yoooov)/yoooov
if [ -d "$TRIMPATH1" ];then
	TRIMPATH=$TRIMPATH1
fi
OPTS="-gcflags=-trimpath=$TRIMPATH -asmflags=-trimpath=$TRIMPATH"

rm -rf sdk-linux-*.tar.gz
rm -rf libshadowtunnel-sdk.so libshadowtunnel-sdk.h

#linux 32bit
CGO_ENABLED=1 GOARCH=386 GOOS=linux go build -buildmode=c-shared $OPTS -ldflags "-s -w $X" -o libshadowtunnel-sdk.so sdk.go
tar zcf sdk-linux-32bit-${VERSION}.tar.gz libshadowtunnel-sdk.so libshadowtunnel-sdk.h
rm -rf libshadowtunnel-sdk.so libshadowtunnel-sdk.h

#linux 64bit
CGO_ENABLED=1 GOARCH=amd64 GOOS=linux go build -buildmode=c-shared $OPTS -ldflags "-s -w $X" -o libshadowtunnel-sdk.so sdk.go
tar zcf sdk-linux-64bit-${VERSION}.tar.gz libshadowtunnel-sdk.so libshadowtunnel-sdk.h
rm -rf libshadowtunnel-sdk.so libshadowtunnel-sdk.h

echo "done."



