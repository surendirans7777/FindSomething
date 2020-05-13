#!/bin/bash
echo "                                                                            "
echo "                                                                            "
echo "----------------------------"
echo "|                          |"
echo "|       $(tput setaf 2)FindSomeThing$(tput sgr 0)      |"
echo "|                          |"
echo "----------------------------"
echo "                                                                            "
echo "                                                                            "
echo "$(tput setaf 3)FileName: $(tput sgr 0)"
read Filename
echo "                                                                            "
echo "                                                                            "
echo "$(tput setaf 4)OUTPUT$(tput sgr 0)"
echo " "
while read LINE; do
  curl -o /dev/null --silent --head --write-out "%{http_code} || $LINE\n" "$LINE" 
  curl --silent $LINE > awes.txt 
while IFS= read -r line; do
 grep -o -P --color=auto "^.*$line.{0,100}.(';|',|\";|'|\")$"  awes.txt
done < sensitive_keywords.txt
echo "----------------------------------------------------------------------------"
done < $Filename
