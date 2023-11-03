#!/bin/bash

command='1'
while [ "$command" -ne "0" ]
do
  echo ''
  echo 'Commands:'
  echo ''
  echo '[0] exit'
  echo '[1] build and deploy ALL to AUTHOR'
  echo '[2] build and deploy ALL to PUBLISH'
  echo '[3] build and deploy just FRONTEND to AUTHOR'
  echo '[4] build and deploy just FRONTEND to PUBLISH'
  echo '[5] build and deploy just CORE to AUTHOR'
  echo '[6] build and deploy just FRONTEND-REACT to AUTHOR'
  echo '[7] build and deploy just FRONTEND-REACT to PUBLISH'
  echo '[8] build and deploy just ui.apps to AUTHOR'
  echo '[9] build and deploy just ui.content to AUTHOR'
  echo '[10] build and deploy just ui.config to AUTHOR'
  echo ''

  read -p 'Command: ' command

  case "$command" in
    ("1") cd /home/app && mvn -Daem.host=aem-author clean install -PautoInstallPackage ;;
    ("2") cd /home/app && mvn -Daem.publish.host=aem-publish clean install -PautoInstallPackagePublish ;;
    ("3") cd /home/app && mvn -Daem.host=aem-author -Dmaven.test.skip clean install -pl ui.frontend -PautoInstallPackage ;;
    ("4") cd /home/app && mvn -Daem.publish.host=aem-publish -Dmaven.test.skip clean install -pl ui.frontend -PautoInstallPackagePublish ;;
    ("5") cd /home/app && mvn -Daem.host=aem-author -Dmaven.test.skip clean install -pl core -PautoInstallBundle ;;
    ("6") cd /home/app && mvn -Daem.host=aem-author -Dmaven.test.skip clean install -pl ui.frontend.react -PautoInstallPackage ;;
    ("7") cd /home/app && mvn -Daem.publish.host=aem-publish -Dmaven.test.skip clean install -pl ui.frontend.react -PautoInstallPackagePublish ;;
    ("8") cd /home/app && mvn -Daem.host=aem-author -Dmaven.test.skip clean install -pl ui.apps -PautoInstallBundle ;;
    ("9") cd /home/app && mvn -Daem.host=aem-author -Dmaven.test.skip clean install -pl ui.content -PautoInstallBundle ;;
    ("10") cd /home/app && mvn -Daem.host=aem-author -Dmaven.test.skip clean install -pl ui.config -pl ui.apps -PautoInstallBundle ;;
  esac
done
