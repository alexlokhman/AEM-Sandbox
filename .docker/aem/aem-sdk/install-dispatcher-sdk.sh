#!/bin/bash

error() {
    echo >&2 "** error: $1"
    exit 2
}

AEM_SDK_PACKAGE=`ls aem-sdk*.zip | head -n 1`
[ -f "$AEM_SDK_PACKAGE" ] || error "AEM SDK zip file not found"

unzip -o $AEM_SDK_PACKAGE
chmod +x aem-sdk-dispatcher-tools-*.sh
./aem-sdk-dispatcher-tools-*.sh

rm -rf dispatcher

mv dispatcher-sdk-* dispatcher

rm -f aem-sdk-dispatcher-tools-*.sh aem-sdk-dispatcher-tools-*.zip aem-sdk-quickstart*.jar


#add the Dispatcher Docker image into the registry
arch=$(uname -m)
echo "Architecture: ${arch}"

if [ "$arch" = "arm64" ]; then
    file=dispatcher/lib/dispatcher-publish-arm64.tar.gz
else
    file=dispatcher/lib/dispatcher-publish-amd64.tar.gz
fi
[ -f "${file}" ] || error "unable to find archive at expected location: $file"

#remove the existing Dispatcher image(s)
docker rmi -f `docker images -q adobe/aem-ethos/dispatcher-publish | sort -u`
#load the new Dispatcher image
gunzip -c "${file}" | docker load
#tag the new Dispatcher image with 'latest' tag
imageid=$(docker images -q adobe/aem-ethos/dispatcher-publish)
docker tag $imageid adobe/aem-ethos/dispatcher-publish:latest