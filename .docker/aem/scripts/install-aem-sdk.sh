#!/bin/bash
cd /aem/aem-sdk

AEM_SDK_PACKAGE=`ls aem-sdk*.zip | head -n 1`
echo "Installing AEM SDK from $AEM_SDK_PACKAGE"

unzip -o $AEM_SDK_PACKAGE
mv -f aem-sdk*.jar /aem/aem-quickstart.jar


if [ -d "/aem/crx-quickstart" ]; then
  cd /aem/crx-quickstart
  find . -maxdepth 1 ! -name 'repository' -type d -exec rm -rf {} +
  find . -maxdepth 1 -type f -exec rm -rf {} +
fi

rm -f /aem/aem-sdk/aem-sdk-dispatcher-tools*