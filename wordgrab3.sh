wordgrab3() {
  echo "                             "
  echo "                             "
  echo "--------------------------------------"
  echo "Enter the Particular URL of the Target"
  echo "--------------------------------------"
  read url
  echo "                             "
  echo "                             "
  echo "                             "
  echo "                             "

  echo "Words along with the length"
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
echo "Some Sensitive Keywords"
echo "-----------------------"
curl $url | grep 'api\|key\|host\|token'  
