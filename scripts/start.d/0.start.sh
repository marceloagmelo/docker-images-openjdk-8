#!/bin/bash
set -e
set -o pipefail

echo "========================================="
echo "Starting"
echo "========================================="

#### I have to validate if ARTIFACT_URL is available
if [ -n "$ARTIFACT_URL" ]
then
  file=`basename "$ARTIFACT_URL"`
  wget -q --no-check-certificate --connect-timeout=5 --read-timeout=10 --tries=2 -O "$APP_HOME/$file" "$ARTIFACT_URL"
  chmod 755 $APP_HOME/$file
  JAR_PATH=$APP_HOME/$file
fi

if [ -f "$JAR_PATH" ]; then
	java $JAVA_HEAP $JAVA_OPTS_EXT -jar $JAR_PATH $JAVA_PARAMETERS
else
	tail -f /opt/run.log
fi

