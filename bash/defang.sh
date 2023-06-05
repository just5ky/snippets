#!/bin/sh

function defang {
  if [ -z "$1" ];
  then
    echo "This is used to defang (and refang) links. Example: http://gatech.edu -> hxxp://gatech[.]edu"
    echo "Usage:"
    echo ""
    echo "   Basic: Has no flags. Simply type the URL that you wish to defang."
    echo "          Command: defang http://gatech.edu"
    echo "          Result:  hxxp://gatech[.]edu"
    echo ""
    echo "      -f: File flag. Use when wanting to defang multiple URLs that are in a file."
    echo "          Command: cat defang_url.txt"
    echo "                   http://gatech.edu"
    echo "                   security.gatech.edu"
    echo "                   http://oit.gatech.edu"
    echo "                   defang -f defang_url.txt"
    echo "          Result:  hxxp://gatech[.]edu"
    echo "                   security[.]gatech[.]edu"
    echo "                   hxxp://oit[.]gatech[.]edu"
    echo ""
    echo "      -r: Reverse flag. Used when you have a defanged URL that you want to refang. USE WITH CAUTION!!!"
    echo "          Command: defang -r hxxp://gatech[.]edu"
    echo "          Result:  http://gatech.edu"
  fi

  case "$1" in
    "-f") cat "$2" | sed 's/http/hxxp/g' | sed 's/\./[\.]/g';;
    "-r") echo "$2" | sed 's/hxxp/http/g' | sed 's/[\.]/\./g';;
    *) echo "$1" | sed 's/http/hxxp/g' | sed 's/\./[\.]/g';;
  esac
}
