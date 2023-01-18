#!/bin/bash

LATEST_RELEASE_URL=$(curl -s "https://api.github.com/repos/trustwallet/wallet-core/releases/latest" | jq -r '.assets[] | select(.name == "kdoc.zip").browser_download_url')
FILENAME=$(basename "$LATEST_RELEASE_URL")
rm -rf ${FILENAME} dokka-out
echo "Downloading: ${LATEST_RELEASE_URL}"
curl --progress-bar -fSOL ${LATEST_RELEASE_URL}
echo "Unzipping: ${FILENAME}"
unzip -q ${FILENAME} && rm -rf ${FILENAME}
echo "Done"
