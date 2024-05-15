 #!/usr/bin/env bash

(("$#"< 1)) && { echo "Mande algum paramentro"; exit 1 ;}

while [[ "$1" ]]; do
        if ! type -P "$1" >&- 2>& >> erros.txt  ; then
                echo -e "\033[31;1mO programa $1 nao existe\033[m"
        else
                echo -e "\033[32;1mAqui esta O Programa $1 ele existe\033[m"
        fi
        shift
 done
