#!/bin/bash

echo "Check for the AEM SDK version"
SDK_SUPPLIED=`ls /aem/aem-sdk/aem-sdk*.zip | head -n 1`
echo "Found SDK Package: $SDK_SUPPLIED"
SDK_VERSION_SUPPLIED=`echo $SDK_SUPPLIED | sed 's/.*aem-sdk-\([^-]*-[0-9]*\).*/\1/'`
echo "Supplied SDK version: $SDK_VERSION_SUPPLIED"

SDK_INSTALLED=`ls /aem/crx-quickstart/app/cq-quickstart*.jar | head -n 1`
echo "Current SDK Package: $SDK_INSTALLED"
SDK_VERSION_INSTALLED=`echo $SDK_INSTALLED | sed 's/.*cq-quickstart-cloudready-\([^-]*-[0-9]*\)-.*/\1/'`
echo "Installed SDK version: $SDK_VERSION_INSTALLED"

if [[ $SDK_VERSION_SUPPLIED != $SDK_VERSION_INSTALLED ]]; then
  echo "Install the supplied SDK"
  /bin/bash /aem/install-aem-sdk.sh
else
  echo "Supplied SDK already installed, no upgrade necessary"
fi

exec java $AEM_JVM_OPTS $AEM_RUNMODE -jar $AEM_JARFILE $AEM_START_OPTS

#/bin/tini -- bash /aem/run-tini.sh