#!/bin/bash

# Jenkins CLI JAR path
CLI_JAR="jenkins-cli.jar"

# Jenkins URL
JENKINS_URL="http://worker:32000/"

# Jenkins admin credentials (update these)
USER="admin"
PASSWORD="123"

# File containing the list of plugins
PLUGINS_FILE="plugins.txt"
FORMATTED_FILE="formatted-plugins.txt"

awk '{
    # Extract the first field as the plugin name
    plugin_name = $1;

    # Check if the last field contains parentheses
    if ($NF ~ /\(.*\)/) {
        # Use the second-to-last field as the version
        plugin_version = $(NF-1);
    } else {
        # Otherwise, use the last field as the version
        plugin_version = $NF;
    }

    # Print the plugin name and version in the desired format
    print plugin_name ":" plugin_version;
}' $PLUGINS_FILE > $FORMATTED_FILE


java -jar jenkins-cli.jar -s $JENKINS_URL -auth $USER:$PASSWORD install-plugin $(cat $FORMATTED_FILE)

java -jar jenkins-cli.jar -s $JENKINS_URL -auth $USER:$PASSWORD safe-restart
