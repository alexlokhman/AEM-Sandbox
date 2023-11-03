## Install / update the AEM SDK

To install or update the AEM Quickstart SDK that is used in the local dev Docker containers follow these steps:

- If present delete the existing AEM SDK zip file from this folder
- Download the AEM Quickstart SDK from the Adobe Software Distribution website:
	https://experience.adobe.com/#/downloads/content/software-distribution/en/aemcloud.html

  (It is recommended to use the same SDK version that is currently installed on the Production environment.)
- Once downloaded place the SDK zip archive (as is, not extracted) into this folder
- Execute the 'install-dispatcher-sdk.sh' script in this folder, this ensures the AEM Dispatcher Docker image is installed in the host system
- Finally RESTART the Author and Publish containers. Upon start if a different SDK version is detected in this folder it will be automatically installed in the containers.