#!/bin/bash
echo "                                                                            "
echo "                                                                            "
echo "------------------------------------------------------------------------------"
echo "$(tput setaf 1)$(tput setab 7)Give me file that have list of urls and I will give you Sensitive Items output$(tput sgr 0)"
echo "------------------------------------------------------------------------------"
echo "                                                                            "
echo "                                                                            "
read Filename
echo "                                                                            "
echo "                                                                            "
while read LINE; do
  curl -o /dev/null --silent --head --write-out "%{http_code} $LINE\n" "$LINE" 
  curl -o /dev/null --silent --head --write-out "%{http_code} $LINE\n" "$LINE" | grep 200 >> output-status.txt && sed -i 's/200/ /' output-status.txt 


  curl --silent $LINE > awes.txt 


while IFS= read -r line; do
 grep -o -P --color=auto "$line.{0,100}.(';|',|\";|'|\")$" awes.txt
 grep -o -P --color=auto "$line.{0,100}.;$" awes.txt >> Output_Sensitive_items.txt

done < sensitive_keywords.txt
done < $Filename

