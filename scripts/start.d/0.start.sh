#!/bin/bash
set -e
set -o pipefail

echo "========================================="
echo "Starting"
echo "========================================="

#### I have to validate if ARTIFACT_URL is available
file="java-application-1.0-SNAPSHOT.jar"

if [ -n "$ARTIFACT_URL" ]
then
  file=`basename "$ARTIFACT_URL"`
  wget -q --no-check-certificate --connect-timeout=5 --read-timeout=10 --tries=2 -O "$APP_HOME/$file" "$ARTIFACT_URL"
  chmod 755 $APP_HOME/$file
fi


java -jar $APP_HOME/$file
