wordgrab3() {
  echo "                             "
  echo "                             "
  echo "--------------------------------------"
  echo "$(tput setaf 1)$(tput setab 2)Enter the Particular URL of the Target$(tput sgr 0)"
  echo "--------------------------------------"
  read url
  echo "                             "
  echo "                             "
  echo "                             "
  echo "                             "

  echo "$(tput setaf 1)$(tput setab 7)Words along with the length$(tput sgr 0)"
  echo "---------------------------"
  tmpfile="$(date "+%s")"
  curl -sLk -m 3 $url | html2text | egrep -io "[0-9a-zA-Z\-]+" | tr '[:upper:]' '[:lower:]' | sed -r "s/^[^a-z]+//g" | sed -r "s/[^a-z0-9]+$//g" | sort -fu | tee -a $tmpfile | tr '-' '.'  | tee -a $tmpfile | tr "." "\n" >> $tmpfile
  cat $tmpfile | sort -fu -o output3.txt
  rm $tmpfile
}

wordgrab3
awk '{ print length(), $0 | "sort -n" }' output3.txt 

echo "                             "
echo "                             "
echo "                             "
echo "$(tput setaf 1)$(tput setab 7)Some Sensitive Keywords$(tput sgr 0)"
echo "-----------------------"
grep 'api\|key\|host\|token' output3.txt
echo "                             "
echo "                             "
echo "                             "


echo "$(tput setaf 1)$(tput setab 7)Found Sensitive Items$(tput sgr 0)"
echo "-----------------------"
curl --silent $url | grep 'api\|key\|host\|token' 
echo "                             "
